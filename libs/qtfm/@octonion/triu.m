function d = triu(v, k)
% TRIU Extract upper triangular part.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 2), nargoutchk(0, 1) 

if nargin == 1
    d = overload(mfilename, v);
else
    d = overload(mfilename, v, k);
end

% $Id: triu.m,v 1.3 2016/06/15 13:19:43 sangwine Exp $
