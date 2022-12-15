function p = real(o)
% REAL   Real part of an octonion.
% (Octonion overloading of standard Matlab function.)
%
% This function returns the octonion that is the real part of o.

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

p = overload(mfilename, o);

% $Id: real.m,v 1.3 2016/06/15 13:19:43 sangwine Exp $
