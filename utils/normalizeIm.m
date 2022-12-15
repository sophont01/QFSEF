function[imN] = normalizeIm(im,mn,mx)
narginchk(1,3);
imN = rgb2hsv(im);

if (nargin<3)
    mx = double(max(max(im(:,:,3))));
    mn = double(min(min(im(:,:,3))));
end
imN(:,:,3) = (imN(:,:,3) - mn)./(mx - mn+eps);
imN = hsv2rgb(imN);
end
