function test_exp
% Test code for the quaternion exponential function. This also tests the
% axis, modulus, and unit functions as well as many others.

% Copyright © 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing exponential function ...')

T = 1e-12;

% Test 1. Real quaternion data.

q = quaternion(randn(100,100), randn(100,100), randn(100,100), randn(100,100));

compare(q, abs(q) .* exp(axis(q) .* angle(q)), T, 'quaternion/exp failed test 1.');

% Test 2. Complex quaternion data.

b = complex(q, quaternion(randn(100,100), randn(100,100), randn(100,100), randn(100,100)));

compare(b, abs(b) .* exp(axis(b) .* angle(b)), T, 'quaternion/exp failed test 2.');

disp('Passed');

% $Id: test_exp.m,v 1.7 2010/05/12 21:08:12 sangwine Exp $
