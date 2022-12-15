function test_exp
% Test code for the quaternion exponential function. This also tests the
% axis, modulus, and unit functions as well as many others.

% Copyright (c) 2005, 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing exponential function ...')

T = 1e-12;

% Test 1. Real quaternion data.

q = randq(100) .* randn(100);

compare(q, abs(q) .* exp(axis(q) .* angle(q)), T, 'quaternion/exp failed test 1.');

% Test 2. Complex quaternion data.

b = complex(q, quaternion(randn(100,100), randn(100,100), randn(100,100), randn(100,100)));

compare(b, abs(b) .* exp(axis(b) .* angle(b)), T, 'quaternion/exp failed test 2.');

% Test 3. Real octonion data.

q = rando(100) .* randn(100);

compare(q, abs(q) .* exp(axis(q) .* angle(q)), T, 'octonion/exp failed test 3.');

% Test 4. Complex octonion data.

b = complex(q, rando(100) .* randn(100));

compare(b, abs(b) .* exp(axis(b) .* angle(b)), T, 'octonion/exp failed test 4.');

disp('Passed');

% $Id: test_exp.m,v 1.9 2016/06/15 13:19:44 sangwine Exp $
