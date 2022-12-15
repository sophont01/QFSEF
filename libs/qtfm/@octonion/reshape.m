function a = reshape(q, varargin)
% RESHAPE Change size.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

nargoutchk(0, 1)

a = overload(mfilename, q, varargin{:});

% $Id: reshape.m,v 1.2 2016/06/15 13:19:43 sangwine Exp $
