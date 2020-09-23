function test_sqrt
% Test code for the quaternion sqrt function.

% Copyright © 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing square root function ...')

T = 1e-12;

% Test 1. Real quaternion data.

q = randq(100);

compare(q, sqrt(q) .^2, T, 'quaternion/sqrt failed test 1.');

% Test 2. Complex quaternion data.

b = complex(q, randq(100));

compare(b, sqrt(b) .^2, T, 'quaternion/sqrt failed test 2.');

% Test 3. Complex quaternion data with undefined axis.

b = quaternion(scalar(b));

compare(b, sqrt(b) .^2, T, 'quaternion/sqrt failed test 3.');

% Test 4. Complex quaternion data with mixture of defined and undefined
% axes.

b = complex(q, randq(100));
n = rand(100) > 0.5; % Random logical array, 50:50 true:false.
b(n) = quaternion(scalar(b(n))); % Null out the vector parts.

compare(b, sqrt(b) .^2, T, 'quaternion/sqrt failed test 4.');

% Test 5. Quaternions with real scalar parts and null vector parts.
% Some of the values are negative and should have imaginary roots.

b = quaternion(randn(100));
compare(b, sqrt(b).^2, T, 'quaternion/sqrt failed test 5.');
          
disp('Passed');

% $Id: test_sqrt.m,v 1.6 2011/12/06 21:12:48 sangwine Exp $
