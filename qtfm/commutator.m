function c = commutator(a, b)
% COMMUTATOR Computes the commutator of the two parameters.

% Copyright © 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(0, 1, nargout))

c = a * b - b * a;

if isa(c, 'quaternion') || isa(c, 'octonion')
    c = vector(c); % The result is pure by definition.
end

end

% $Id: commutator.m,v 1.1 2013/03/26 15:10:22 sangwine Exp $
