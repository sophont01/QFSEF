function u = uplus(a)
% +  Unary plus.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

u = a; % Since + does nothing, we can just return a.

% $Id: uplus.m,v 1.5 2016/06/15 13:19:43 sangwine Exp $

