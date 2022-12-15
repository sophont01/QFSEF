function b = cast(q, newclass)
% CAST  Cast quaternion variable to different data type.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(2, 2), nargoutchk(0, 1)

if ~ischar(newclass)
    error('Second parameter must be a string.')
end

b = overload(mfilename, q, newclass);

% $Id: cast.m,v 1.5 2016/06/15 13:19:42 sangwine Exp $

