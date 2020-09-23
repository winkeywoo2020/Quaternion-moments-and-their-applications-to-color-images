function Z = mpower(X, Y)
% ^   Matrix power.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Powers of an octonion matrix are not implemented because');
disp('multiplication is not associative.');
   
unimplemented(mfilename)

% Note: A^3 could mean A * (A * A) or (A * A) * A, which have different
% results. Therefore we can't define a unique result for any matrix power
% beyond A^2. It is simpler to force the user to type A * A, than to
% implement mpower, but if it is ever decided to be useful, the code exists
% in the quaternion mpower function and could be adapted.

% $Id: mpower.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
