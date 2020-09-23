function test_orthonormal
% Test code for the orthogonal and orthonormal_basis functions.

% Copyright © 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing orthogonal and orthonormal_basis functions ...')

T = 1e-12;

% The first set of tests depend on the choices made in the
% code for orthogonal. They are not unique solutions.

compare( qj, orthogonal( qi), T, 'orthogonal failed test 1.');
compare( qk, orthogonal( qj), T, 'orthogonal failed test 2.');
compare( qi, orthogonal( qk), T, 'orthogonal failed test 3.');
compare(-qj, orthogonal(-qi), T, 'orthogonal failed test 4.');
compare(-qk, orthogonal(-qj), T, 'orthogonal failed test 5.');
compare(-qi, orthogonal(-qk), T, 'orthogonal failed test 6.');

compare(eye(3), orthonormal_basis(qi), T, 'orthonormal_basis failed test 7.');

% Now we try some random values, real and complex, and test for correct
% orthogonality of the basis.

for A = 1:100
   B = orthonormal_basis(randv);
   compare(B * B.', eye(3), T, 'orthonormal_basis failed test 8.');
   C = orthonormal_basis(unit(complex(randv, randv)));
   compare(C * C.', eye(3), T, 'orthonormal_basis failed test 9.');
end

disp('Passed');

% $Id: test_orthonormal.m,v 1.1 2013/04/02 14:20:00 sangwine Exp $
