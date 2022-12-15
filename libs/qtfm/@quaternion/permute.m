function B = permute(A, order)
% PERMUTE Rearrange dimensions of N-D array
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(2, 2), nargoutchk(0, 1)

B = overload(mfilename, A, order);

% $Id: permute.m,v 1.5 2016/06/15 13:19:43 sangwine Exp $

