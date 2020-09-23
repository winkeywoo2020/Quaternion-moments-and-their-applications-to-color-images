function p = vector(o)
% VECTOR   Octonion vector part.

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

p = o; p.a = v(p.a); % Copy, then take the vector part of the a quaternion.

end

% $Id: vector.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
