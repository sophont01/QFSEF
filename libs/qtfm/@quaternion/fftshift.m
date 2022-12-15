function Y = fftshift(X, dim)
% FFTSHIFT Shift zero-frequency component to center of spectrum.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 2), nargoutchk(0, 1) 

if nargin == 1
    Y = overload(mfilename, X);
else
    Y = overload(mfilename, X, dim);
end

% $Id: fftshift.m,v 1.6 2016/06/15 13:19:42 sangwine Exp $

