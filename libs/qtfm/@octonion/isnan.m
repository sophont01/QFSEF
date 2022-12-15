function tf = isnan(A)
% ISNAN  True for Not-a-Number.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2015 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

tf = isnan(A.a) | isnan(A.b);

% $Id: isnan.m,v 1.2 2016/06/15 13:19:44 sangwine Exp $
