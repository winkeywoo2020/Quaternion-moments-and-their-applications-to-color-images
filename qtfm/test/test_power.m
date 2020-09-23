function test_power
% Test code for the quaternion power function (.^).

% This also tests the exponential and log functions, plus sqrt/conj etc.

% Copyright © 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing power function (.^) ...');

T = 1e-12;

q = quaternion(randn(100), randn(100), randn(100), randn(100));

% Scalar powers handled as special cases.

compare(q,       q.^1,   T, 'quaternion/power failed test 1.');
compare(q.*q,    q.^2,   T, 'quaternion/power failed test 2.');
compare(sqrt(q), q.^0.5, T, 'quaternion/power failed test 3.');
compare(q,  (q.^-1).^-1, T, 'quaternion/power failed test 4.');
compare(q,(q.^-0.5).^-2, T, 'quaternion/power failed test 5.');

% General scalar power. 3 is not handled as a special case, so we can
% compare it with cubing explicitly.

compare(q.*q.*q, q.^3, T,   'quaternion/power failed test 6.');

% Scalar raised to a vector power.

compare(qi.^[0 1 2 3], [quaternion( 1,  0, 0, 0), ...
                        quaternion( 0,  1, 0, 0), ...
                        quaternion(-1,  0, 0, 0), ...
                        quaternion( 0, -1, 0, 0)],...
                        T, 'quaternion/power failed test 7.');
disp('Passed');

% $Id: test_power.m,v 1.3 2010/05/12 21:08:12 sangwine Exp $
