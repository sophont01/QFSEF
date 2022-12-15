function R = fftflip2(X)
% FFTFLIP2  Interchange elements to effect time reversal/frequency reversal.

% Copyright (c) 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% Reversal in 2 dimensions. See the 1d function fftflip.m for what this
% does. The implementation here applies the 1D fftflip to the columns, then
% applies the 1D fftflip to the rows of the result using the transpose.

R = fftflip(fftflip(X).').';

end

% $Id: fftflip2.m,v 1.2 2016/06/15 13:19:44 sangwine Exp $