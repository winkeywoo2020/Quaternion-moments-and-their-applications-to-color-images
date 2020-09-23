function p = vector(q)
% VECTOR   Quaternion vector part. Synonym of V.

% Copyright © 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

p = q; p.w = []; % Copy and then set the scalar part to empty.

% $Id: vector.m,v 1.5 2010/05/13 20:34:41 sangwine Exp $
