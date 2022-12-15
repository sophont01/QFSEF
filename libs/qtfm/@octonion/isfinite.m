function tf = isfinite(A)
% ISFINITE  True for finite elements.  
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

tf = isfinite(A.a) & isfinite(A.b);

end

% $Id: isfinite.m,v 1.3 2016/06/15 13:19:44 sangwine Exp $
