function E = oneso(varargin)
% ONESO   Octonion matrix of ones. Takes the same parameters as the
% Matlab function ONES (q.v.). NB: The vector part is zero, not ones.

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

E = octonion(ones(varargin{:}));

% $Id: oneso.m,v 1.2 2016/06/15 13:19:44 sangwine Exp $

