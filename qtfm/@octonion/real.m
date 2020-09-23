function p = real(o)
% REAL   Real part of an octonion.
% (Octonion overloading of standard Matlab function.)
%
% This function returns the octonion that is the real part of o.

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

p = overload(mfilename, o);

% $Id: real.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
