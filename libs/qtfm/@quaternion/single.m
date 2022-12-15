function d = single(q)
% SINGLE Convert quaternion to single precision (obsolete).
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(['Conversion to single from quaternion is not possible. ',...
       'Try cast(q, ''single'')'])

% Note: this function was replaced from version 0.9 with the convert
% function, because it is incorrect to provide a conversion function
% that returns a quaternion result. The convert function provides the
% same functionality, but will not be called implicitly by Matlab to
% implement an assignment like X(1,2) = quaternion(1,2,3,4) which gave
% erroneous results prior to version 0.9 and now raises an error.

% $Id: single.m,v 1.5 2016/06/15 13:19:43 sangwine Exp $

