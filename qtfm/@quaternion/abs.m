function a = abs(q)
% ABS Absolute value, or modulus, of a quaternion.
% (Quaternion overloading of standard Matlab function.)

% Copyright © 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout)) 

% Because abs is so heavily used, the code here is inline. It is copied
% from the function normq, based on the former private function modsquared.

if isempty(q.w)
    a = sqrt(         q.x.^2 + q.y.^2 + q.z.^2);
else
    a = sqrt(q.w.^2 + q.x.^2 + q.y.^2 + q.z.^2);
end

end

% $Id: abs.m,v 1.3 2010/12/19 17:06:52 sangwine Exp $
