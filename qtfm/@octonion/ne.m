function r = ne(a, b)
% ~=  Not equal.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(0, 1, nargout)) 

r = ~(a == b); % Use the octonion equality operator and invert the result.

% $Id: ne.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
