function t = ctranspose(a)
% '   Quaternion conjugate transpose.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

%t = conj(transpose(a));

% Because ctranspose is such a fundamental operation, it is coded directly
% here rather than calling the overload function as in the original code
% above.

t = a;
t.w =  transpose(t.w); % Transposing empty gives empty, so no harm if pure.
t.x = -transpose(t.x); % The conjugate is coded here using unary minus to
t.y = -transpose(t.y); % save calling overhead.
t.z = -transpose(t.z);

% $Id: ctranspose.m,v 1.5 2016/06/15 13:19:43 sangwine Exp $
