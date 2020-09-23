function p = imag(o)
% IMAG   Imaginary part of an octonion.
% (Octonion overloading of standard Matlab function.)
%
% This function returns the octonion that is the imaginary
% part of o. If o is a real octonion, it returns zero.

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

p = overload(mfilename, o);

% $Id: imag.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
