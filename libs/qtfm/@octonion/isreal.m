function tf = isreal(A)
% ISREAL True for real (octonion) array.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% This function returns true if both quaternion components of A are real,
% that is, A is an octonion with real coefficients (a real octonion).

narginchk(1, 1), nargoutchk(0, 1)

tf = isreal(A.a) && isreal(A.b);

% $Id: isreal.m,v 1.3 2016/06/15 13:19:44 sangwine Exp $
