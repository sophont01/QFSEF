function p = vector(o)
% VECTOR   Octonion vector part.

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

p = o; p.a = v(p.a); % Copy, then take the vector part of the a quaternion.

end

% $Id: vector.m,v 1.3 2016/06/15 13:19:43 sangwine Exp $
