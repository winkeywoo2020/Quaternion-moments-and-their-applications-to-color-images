function u = uminus(a)
% -  Unary minus.
% (Quaternion overloading of standard Matlab function.)

% Copyright © 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout)) 

u = a;
if ~isempty(u.w)
    u.w = -u.w;
end
u.x = -u.x;
u.y = -u.y;
u.z = -u.z;

% $Id: uminus.m,v 1.6 2010/11/04 21:55:26 sangwine Exp $
