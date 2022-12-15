function n = numel(o, varargin)
% NUMEL   Number of elements in an array or subscripted array expression.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011, 2016 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

if nargin == 1
    % The two components of the octonion cannot have different sizes, so we
    % just pass the first of the two to the quaternion numel.
    
    n = numel(o.a);
else
    n = numel(o.a, varargin);
end
    
end

% $Id: numel.m,v 1.3 2016/06/15 10:30:51 sangwine Exp $
