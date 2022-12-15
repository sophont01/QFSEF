function tf = isnan(A)
% ISNAN  True for Not-a-Number.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

if isempty(A.w)
    tf = isnan(A.x) | isnan(A.y) | isnan(A.z);
else
    tf = isnan(A.w) | isnan(vee(A));
end

% $Id: isnan.m,v 1.8 2016/06/15 13:19:43 sangwine Exp $
