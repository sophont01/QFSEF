function b = repmat(a, m, n)
% REPMAT Replicate and tile an array.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005, 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(2, 3), nargoutchk(0, 1) 

if nargin == 2
    b = overload(mfilename, a, m);
else
    b = overload(mfilename, a, m, n);
end

% $Id: repmat.m,v 1.6 2016/06/15 13:19:43 sangwine Exp $

