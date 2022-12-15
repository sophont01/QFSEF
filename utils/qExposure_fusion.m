%{
Copyright (c) 2015, Tom Mertens
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%}

%
% Implementation of Exposure Fusion
%
% written by Tom Mertens, Hasselt University, August 2007
% e-mail: tom.mertens@gmail.com
%
% This work is described in
%   "Exposure Fusion"
%   Tom Mertens, Jan Kautz and Frank Van Reeth
%   In Proceedings of Pacific Graphics 2007
%
%
% Usage:
%   result = exposure_fusion(I,m);
%   Arguments:
%     'I': represents a stack of N color images (at double
%       precision). Dimensions are (height x width x 3 x N).
%     'm': 3-tuple that controls the per-pixel measures. The elements
%     control contrast, saturation and well-exposedness, respectively.
%
% Example:
%   'figure; imshow(exposure_fusion(I, [0 0 1]);'
%   This displays the fusion of the images in 'I' using only the well-exposedness
%   measure
%

function R = qExposure_fusion(I,m,dEmask)

narginchk(2,3);

r = size(I,1);
c = size(I,2);
N = size(I,4);

W = ones(r,c,N);

%compute the measures and combines them into a weight map
% smth_parm = m(1);       % smoothens locally in a 5x5 window
% sat_parm = m(2);        % smoothens colors close to global average
% wexp_parm = m(3);       % smoothens intensity close to 0.5
% contrast_parm = m(4);   % sharpens in local window
% lReg_parm = m(5);       % sharpens using dE luminance channel
sat_parm      = m.wsat;        % smoothens colors close to global average
wexp_parm     = m.wexp;       % smoothens intensity close to 0.5
contrast_parm = m.wcont;   % sharpens in local window
lReg_parm     = m.wdel;       % sharpens using dE luminance channel

if (wexp_parm > 0)
    W = W.*well_exposedness(I).^wexp_parm;
end
if (contrast_parm > 0)
    W = W.*contrast(I).^contrast_parm;
end
if (sat_parm > 0)
    W = W.*saturation(I).^sat_parm;
end
if (lReg_parm > 0) && (nargin==3)
    W = W.*lReg(dEmask).^lReg_parm;
end


%normalize weights: make sure that weights sum to one for each pixel
W = W + 1e-12; %avoids division by zero
W = W./repmat(sum(W,3),[1 1 N]);

% create empty pyramid
pyr = gaussian_pyramid(zeros(r,c,3));
nlev = length(pyr);

% multiresolution blending
for i = 1:N
    % construct pyramid from each input image
    pyrW = gaussian_pyramid(W(:,:,i));
    pyrI = laplacian_pyramid(I(:,:,:,i));
    
    % blend
    for l = 1:nlev
        w = repmat(pyrW{l},[1 1 3]);
        pyr{l} = pyr{l} + w.*pyrI{l};
    end
end

% reconstruct
R = reconstruct_laplacian_pyramid(pyr);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% contrast measure
function C = contrast(I)
h = [0 1 0; 1 -4 1; 0 1 0]; % laplacian filter
N = size(I,4);
C = zeros(size(I,1),size(I,2),N);
for i = 1:N
    mono = rgb2gray(I(:,:,:,i));
    C(:,:,i) = abs(imfilter(mono,h,'replicate'));
    C(:,:,i) = normalizeMinmax(C(:,:,i));
end
end

% saturation measure
function C = saturation(I)
N = size(I,4);
C = zeros(size(I,1),size(I,2),N);
for i = 1:N
    % saturation is computed as the standard deviation of the color channels
    R = I(:,:,1,i);
    G = I(:,:,2,i);
    B = I(:,:,3,i);
    mu = (R + G + B)/3;
    C(:,:,i) = sqrt(((R - mu).^2 + (G - mu).^2 + (B - mu).^2)/3);
end
end

% well-exposedness measure
function C = well_exposedness(I)
sig = .2;
N = size(I,4);
C = zeros(size(I,1),size(I,2),N);
% sigma = linspace(0.01,1,N);
for i = 1:N
    R = exp(-.5*(I(:,:,1,i) - .5).^2/sig.^2);
    G = exp(-.5*(I(:,:,2,i) - .5).^2/sig.^2);
    B = exp(-.5*(I(:,:,3,i) - .5).^2/sig.^2);
    C(:,:,i) = R.*G.*B;
%     C(:,:,i) = medfilt2(C(:,:,i),[5 5]);
end
end

% illumination regions weight measure
function C = lReg(dE)
N = numel(dE);
% sigma = linspace(0.01,1,N);
sigma = linspace(0.1,1,N);
for i=1:numel(dE)
    dEhsv = rgb2hsv(dE{i});
    dEv = dEhsv(:,:,3);
%     dEvW(i) = i*(mean(dEv(:)))^2;
%     dEvW(i) = i*(sum(dEv(:)))^2;
%     dEvW(i) = (i^2)*(mean(dEv(:)))^2;
%     dEvW(i) = mean(dEv(:))^i;
    dEvW(i) = sum(dEv(:))*i;
    C(:,:,i) = dEv*dEvW(i);
end
C = C/(sum(dEvW(:)));
end
