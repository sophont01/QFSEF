function e = end(a, k, n)
% End indexing for octonion arrays.

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% This function is implemented by calling the Matlab builtin function on
% one component of a. See the corresponding quaternion function for more
% detail.

aa = a.a; % This is the first quaternion component of a.
e = builtin('end', aa.x, k, n);

% $Id: end.m,v 1.2 2016/06/15 13:19:43 sangwine Exp $
