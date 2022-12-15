function E = zerosq(varargin)
% ZEROSQ   N-by-N quaternion matrix of zeros. Takes the same parameters as
% the Matlab function ZEROS (q.v.).

% Copyright (c) 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

E = quaternion(zeros(varargin{:}));

% $Id: zerosq.m,v 1.3 2016/06/15 13:19:44 sangwine Exp $

