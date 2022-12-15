function p = part(o, n)
% PART  Extracts the n-th component of an octonion.
% This may be empty if the octonion is pure.

% Copyright (c) 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(2, 2), nargoutchk(0, 1)

if ~isnumeric(n)
    error('Second parameter must be numeric.')
end

if ismember(n, 1:8)
    p = component(o, n);
else
    error('Second parameter must be an integer in 1:8.')
end

% $Id: part.m,v 1.3 2016/06/15 13:19:44 sangwine Exp $
