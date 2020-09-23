function d = triu(v, k)
% TRIU Extract upper triangular part.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 2, nargin)), error(nargoutchk(0, 1, nargout)) 

if nargin == 1
    d = overload(mfilename, v);
else
    d = overload(mfilename, v, k);
end

% $Id: triu.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
