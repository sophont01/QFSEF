function test_eig
% Test code for the quaternion eigenvalue decomposition.

% Copyright (c) 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing eigenvalue decomposition ...')

T = 1e-12;

A = quaternion(randn(10,10),randn(10,10),randn(10,10),randn(10,10));
A = A * A'; % The matrix must be Hermitian.

[V, D] = eig(A);
compare(A * V , V * D, T, 'quaternion/eig failed test 1A')

D = eig(A);
compare(A * V, ...
        V * diag(D), T,   'quaternion/eig failed test 1B')

disp('Passed');

% $Id: test_eig.m,v 1.5 2016/06/15 13:19:44 sangwine Exp $

