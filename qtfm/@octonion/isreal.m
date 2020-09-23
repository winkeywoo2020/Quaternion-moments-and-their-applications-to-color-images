function tf = isreal(A)
% ISREAL True for real (octonion) array.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% This function returns true if both quaternion components of A are real,
% that is, A is an octonion with real coefficients (a real octonion).

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

tf = isreal(A.a) && isreal(A.b);

% $Id: isreal.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
