function tf = isempty(q)
% ISEMPTY True for empty matrix.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.
     
tf = isempty(q.a);
if tf
    assert(isempty(q.b));
end

% $Id: isempty.m,v 1.2 2016/06/15 13:19:43 sangwine Exp $
