function c = vector_product(a, b)
% VECTOR (cross) PRODUCT of two pure quaternions.

% Copyright © 2005-8, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(0, 1, nargout))

if ~isa(a, 'quaternion') || ~isa(b, 'quaternion')
    error('Vector/cross product is not defined for a quaternion and a non-quaternion.')
end

if ~isempty(a.w) || ~isempty(b.w)
    error('Vector/cross product is defined only for pure quaternions.')
end

c = a;

c.x = a.y .* b.z - a.z .* b.y;
c.y = a.z .* b.x - a.x .* b.z;
c.z = a.x .* b.y - a.y .* b.x;

% $Id: vector_product.m,v 1.7 2010/11/04 21:53:09 sangwine Exp $
