function t = sum(a, dim)
% SUM Sum of elements.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 2), nargoutchk(0, 1)

if nargin == 1
    t = overload(mfilename, a);
else
    if ischar(dim)
        if (strcmp(dim, 'double') || strcmp(dim, 'native'))
            error(['Parameters ''double'' or ''native'' are not'...
                   ' implemented in the quaternion sum function.']);
        else
            error('Dimension argument must be numeric');
        end
    end
    
    if ~isnumeric(dim)
        error('Dimension argument must be numeric');
    end
    
    if ~isscalar(dim) || ~ismember(dim, 1:ndims(a))
        error(['Dimension argument must be a positive'...
               ' integer scalar within indexing range.']);
    end
    
    t =  overload(mfilename, a, dim);
end

% $Id: sum.m,v 1.8 2016/06/15 13:19:42 sangwine Exp $

