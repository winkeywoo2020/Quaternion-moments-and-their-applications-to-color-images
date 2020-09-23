function o = minus(l, r)
% -   Minus.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(0, 1, nargout)) 

o = plus(l, -r); % We use uminus to negate the right argument.

% $Id: minus.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
