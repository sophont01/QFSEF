function tf = isfinite(A)
% ISFINITE  True for finite elements.  
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

if isempty(A.w)
    tf = isfinite(A.x) & isfinite(A.y) & isfinite(A.z);
else
    tf = isfinite(A.w) & isfinite(vee(A));
end

% $Id: isfinite.m,v 1.9 2016/06/15 13:19:43 sangwine Exp $
