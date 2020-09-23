function test_slerp
% Test code for the slerp function.

% This also tests the exponential and log functions, plus sqrt/conj etc
% because it uses the power function.

% Copyright © 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing slerp function ...');

T = 1e-12;

compare(slerp(qi, qj, 0.5), ...
        unit(qi+qj),           T, 'quaternion/slerp failed test 1.');
compare(slerp(qi, qj, 0:0.5:1), ...
        [qi, unit(qi+qj), qj], T, 'quaternion/slerp failed test 2.');
    
% Test with random data, using slerp to interpolate half-way between the
% element values.
    
p = unit(quaternion(randn(2), randn(2), randn(2), randn(2)));
q = unit(quaternion(randn(2), randn(2), randn(2), randn(2)));

compare(slerp(p, q, 0.5), unit(p+q), T, 'quaternion/slerp failed test 3.');

disp('Passed');

% TODO Add a more complex test that does not depend on interpolating half
% way between given values. The problem is how to compute the results
% without using slerp, in order to check the results?
% $Id: test_slerp.m,v 1.3 2010/05/12 21:08:12 sangwine Exp $

