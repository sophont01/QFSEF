function test_log
% Test code for the quaternion log function.

% This also tests the exponential function.

% Copyright (c) 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing log function ...');

T = 1e-13;

% Test 1. Real quaternion data.

q = quaternion(randn(100), randn(100), randn(100), randn(100));

compare(q, exp(log(q)), T, 'quaternion/log failed test 1.');

clear q

% Test 2. Complex quaternion data.

b = quaternion(complex(randn(100,100)),complex(randn(100,100)),...
               complex(randn(100,100)),complex(randn(100,100)));

compare(b, exp(log(b)), T, 'quaternion/log failed test 2.');

% Test 3. Comparison with the complex log function.

c = complex(randn(100), randn(100));

compare(log(dc(c)), dc(log(c)), T, 'quaternion/log failed test 3.');

clear c q

disp('Passed');

% $Id: test_log.m,v 1.8 2016/06/15 13:19:44 sangwine Exp $

