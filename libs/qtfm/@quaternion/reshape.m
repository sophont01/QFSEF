function a = reshape(q, varargin)
% RESHAPE Change size.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

nargoutchk(0, 1)

a = overload(mfilename, q, varargin{:});

% $Id: reshape.m,v 1.8 2016/06/15 13:19:42 sangwine Exp $
