function ind = subsindex(~)
% Unimplemented subsindex function for quaternions.
%
% Implementation note: if the user defines a variable named
% e.g. s, x, y, z, and then enters s(a) (where a is a quaternion)
% expecting to get the scalar part of a, Matlab will try to use
% the quaternion a to index the user's variable s.

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error('Subsindex is not implemented for quaternions. Try help quaternion/subsindex.')

% $Id: subsindex.m,v 1.5 2016/06/15 13:19:42 sangwine Exp $
