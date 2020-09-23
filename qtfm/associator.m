function d = associator(a, b, c)
% ASSOCIATOR Computes the associator of the three parameters.

% Reference:
%
% Richard D. Schafer, 'An Introduction to Non-Associative Algebras',
% Academic Press, 1966. Page 13.

% Copyright © 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(3, 3, nargin)), error(nargoutchk(0, 1, nargout))

d = (a * b) * c - a * (b * c);

if isa(c, 'quaternion') || isa(c, 'octonion')
    d = vector(d); % The result is pure by definition.
end

end

% $Id: associator.m,v 1.1 2013/03/26 15:10:22 sangwine Exp $
