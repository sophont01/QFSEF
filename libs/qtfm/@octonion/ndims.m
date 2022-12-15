function n = ndims(o)
% NDIMS   Number of array dimensions.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

n = ndims(o.a); % Call the quaternion ndims on the first quaternion part.
                % (The second quaternion must have the same ndims result.)
% $Id: ndims.m,v 1.2 2016/06/15 13:19:44 sangwine Exp $
