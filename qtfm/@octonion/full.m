function b = full(q)
% FULL  Convert sparse matrix to full matrix.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

b = overload(mfilename, q);

% $Id: full.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
