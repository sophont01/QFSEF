function t = transpose(a)
% .'  Transpose.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

t = overload(mfilename, a);

% $Id: transpose.m,v 1.3 2016/06/15 13:19:44 sangwine Exp $
