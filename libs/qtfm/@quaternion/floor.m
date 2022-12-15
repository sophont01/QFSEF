function a = floor(q)
% FLOOR  Round towards minus infinity.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

a = overload(mfilename, q);

% $Id: floor.m,v 1.6 2016/06/15 13:19:43 sangwine Exp $

