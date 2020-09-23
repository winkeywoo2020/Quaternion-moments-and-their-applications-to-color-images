function test_inverse_hyperbolic
% Test code for the inverse quaternion hyperbolic functions.

% Copyright © 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing inverse hyperbolic functions ...');

T = 1e-12;

% Test 1. Real quaternion data.

q = quaternion(randn(100,100), randn(100,100), randn(100,100), randn(100,100));

compare(sinh(asinh(q)), q, T,...
    'quaternion/asin failed test 1.');
compare(cosh(acosh(q)), q, T,...
    'quaternion/acos failed test 1.');
compare(tanh(atanh(q)), q, T,...
    'quaternion/atan failed test 1.');

% Test 2. Complex quaternion data.

% The functions do not support this at present so there is no test.

disp('Passed');

% $Id: test_inverse_hyperbolic.m,v 1.5 2010/05/12 21:08:12 sangwine Exp $

