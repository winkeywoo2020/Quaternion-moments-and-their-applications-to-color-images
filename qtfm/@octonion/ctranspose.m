function t = ctranspose(a)
% '   Octonion conjugate transpose.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout)) 

t = conj(transpose(a));

% $Id: ctranspose.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
