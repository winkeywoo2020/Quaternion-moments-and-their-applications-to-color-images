function a = normo(o)
% NORMO Norm of an octonion, the sum of the squares of the components.

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout)) 

a = normq(o.a) + normq(o.b);

% $Id: normo.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
