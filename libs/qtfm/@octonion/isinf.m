function tf = isinf(A)
% ISINF  True for infinite elements.  
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2015 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

tf = isinf(A.a) | isinf(A.b);

% $Id: isinf.m,v 1.2 2016/06/15 13:19:43 sangwine Exp $
