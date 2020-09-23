function a = normq(q)
% NORMQ Norm of a quaternion, the sum of the squares of the components.
% The norm is also equal to the product of a quaternion with its conjugate.

% Copyright © 2009, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout)) 

if isempty(q.w) % Code moved from the private function modsquared Dec 2010.
    a =          q.x.^2 + q.y.^2 + q.z.^2;
else
    a = q.w.^2 + q.x.^2 + q.y.^2 + q.z.^2;
end

% $Id: normq.m,v 1.2 2010/12/19 17:12:33 sangwine Exp $
