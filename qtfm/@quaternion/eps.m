function d = eps(X)
% EPS Floating-point relative accuracy.
% (Quaternion overloading of standard Matlab function.)

% Copyright © 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% This function will only be called for the profile eps(X) where X is a
% quaternion. It is implemented only because some Matlab functions call it,
% and if not implemented these functions will not work for quaternions.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout)) 

d = eps(abs(X)); % X is a quaternion, abs(X) is real or complex, and the
                 % eps function called from this line will be the built-in.
end

% $Id: eps.m,v 1.1 2013/04/02 11:37:07 sangwine Exp $
