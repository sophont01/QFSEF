function p = real(q)
% REAL   Real part of a quaternion.
% (Quaternion overloading of standard Matlab function.)
%
% This function returns the quaternion that is the real part of q.

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

p = overload(mfilename, q);

end

% $Id: real.m,v 1.9 2017/07/31 12:13:46 sangwine Exp $
