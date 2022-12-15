function t = ctranspose(a)
% '   Octonion conjugate transpose.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

t = conj(transpose(a));

% $Id: ctranspose.m,v 1.3 2016/06/15 13:19:43 sangwine Exp $
