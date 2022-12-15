function E = onesq(varargin)
% ONESQ   Quaternion matrix of ones. Takes the same parameters as the
% Matlab function ONES (q.v.). NB: The vector part is zero, not ones.

% Copyright (c) 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

E = quaternion(ones(varargin{:}));

% $Id: onesq.m,v 1.3 2016/06/15 13:19:44 sangwine Exp $

