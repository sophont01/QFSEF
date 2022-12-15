function x = s(q)
% S(Q) Scalar part of a full quaternion.

% Copyright (c) 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% narginchk(1, 1), nargoutchk(0, 1)

x = q.w;

% $Id: s.m,v 1.7 2016/06/15 13:19:43 sangwine Exp $
