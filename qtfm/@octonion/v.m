function p = v(q)
% V(Q). Extracts the vector component of an octonion.

% Copyright © 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

p = vector(q); % The vector function does the error checking.

% $Id: v.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
