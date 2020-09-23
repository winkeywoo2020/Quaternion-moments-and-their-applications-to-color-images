function a = abs(o)
% ABS Absolute value, or modulus, of an octonion.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout)) 

a = sqrt(normo(o)); % It might be better to put the code from normo inline
                    % here for speed, eventually.

end

% $Id: abs.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
