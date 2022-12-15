function r = vee(q)
% Extracts the vector component of a quaternion.
% (Actually all it does is set the scalar component to empty, which is more
% efficient and achieves the same effect.)

% Copyright (c) 2007 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

r = q; r.w = [];

% $Id: vee.m,v 1.3 2016/06/15 13:19:45 sangwine Exp $
