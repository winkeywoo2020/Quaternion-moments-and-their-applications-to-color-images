function r = scalar(o)
% SCALAR   Octonion scalar part.
%
% This function returns zero in the case of pure octonions,
% whereas the function s gives empty if o is pure.

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

r = scalar(o.a); % The scalar part is in the 'a' quaternion.

% $Id: scalar.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
