function E = zeroso(varargin)
% ZEROSO   N-by-N octonion matrix of zeros. Takes the same parameters as
% the Matlab function ZEROS (q.v.).

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

E = octonion(zeros(varargin{:}));

% $Id: zeroso.m,v 1.2 2016/06/15 13:19:44 sangwine Exp $
