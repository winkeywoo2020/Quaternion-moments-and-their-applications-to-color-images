function test_lu
% Test code for the quaternion lu function.

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing LU decomposition ...')

T = 1e-12;

A = randq(10);

[L, U, P] = lu(A);
compare(L * U, P * A, T,   'quaternion/lu failed test 1')

A = randq(10,13);

[L, U, P] = lu(A);
compare(L * U, P * A, T,   'quaternion/lu failed test 2')

[L, U, P] = lu(A.');
compare(L * U, P * A.', T, 'quaternion/lu failed test 3')

% Now repeat the whole lot with complex data, but smaller matrices, keeping
% the same tolerance. No particular reason, but no need to keep the same
% sizes.

T = 1e-9; % Relax the requirements a little.

A = complex(randq(5), randq(5));

[L, U, P] = lu(A);
compare(L * U, P * A, T,   'quaternion/lu failed test 4')

A = complex(randq(5,7), randq(5,7));

[L, U, P] = lu(A);
compare(L * U, P * A, T,   'quaternion/lu failed test 5')

[L, U, P] = lu(A.');
compare(L * U, P * A.', T, 'quaternion/lu failed test 6')

disp('Passed');

% $Id: test_lu.m,v 1.3 2011/01/08 21:13:54 sangwine Exp $
