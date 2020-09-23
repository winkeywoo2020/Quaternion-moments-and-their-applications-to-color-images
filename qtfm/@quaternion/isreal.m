function tf = isreal(A)
% ISREAL True for real (quaternion) array.
% (Quaternion overloading of standard Matlab function.)

% Copyright © 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% This function returns true if all the components of A are real, that is,
% A is a quaternion with real coefficients (a real quaternion).

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

if isempty(A.w)
    tf = isreal(A.x) & isreal(A.y) & isreal(A.z);
else
    tf = isreal(A.w) & isreal(vee(A));
end

% $Id: isreal.m,v 1.5 2010/11/04 21:52:42 sangwine Exp $
