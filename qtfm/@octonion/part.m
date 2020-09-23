function p = part(o, n)
% PART  Extracts the n-th component of an octonion.
% This may be empty if the octonion is pure.

% Copyright © 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(0, 1, nargout))

if ~isnumeric(n)
    error('Second parameter must be numeric.')
end

if ismember(n, 1:8)
    p = component(o, n);
else
    error('Second parameter must be an integer in 1:8.')
end

% $Id: part.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
