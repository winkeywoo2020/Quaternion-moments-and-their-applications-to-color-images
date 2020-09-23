function c = vector_product(a, b, c)
% Vector (cross) product of two or three pure octonions. INCOMPLETE!

% Copyright © 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% See the Wikipedia article:
% http://en.wikipedia.org/wiki/Seven-dimensional_cross_product
% for information pertinent to this function.

error(nargchk(2, 3, nargin)), error(nargoutchk(0, 1, nargout))

if ~isa(a, 'octonion') || ~isa(b, 'octonion') || (nargin == 3 && ~isa(c, 'octonion'))
    error('Vector/cross product is not defined for an octonion and a non-octonion.')
end

if ~ispure(a) || ~ispure(b) || (nargin == 3 && ~ispure(c))
    error('Vector/cross product is defined only for pure octonions.')
end

% Reference:
%
% F. Reese Harvey, 'Spinors and Calibrations',
% (Perspectives In mathematics: vol. 9), Academic Press, 1990.
% [See Definition 6.46, p111, and Definition 6.54, p112, which are used
% below. We take the vector part because the multiplications yield a full
% octonion, but the result is theoretically pure.]

if nargin == 2
    c = vector(conj(b) .* a - conj(a) .* b)./2;
else
    c = vector(a .* (conj(b) .* c) - c .* (conj(b) .* a))./2;
end

% TODO Check this code, and understand the results, in particular, how to
% construct a 7-dimensional orthogonal basis, with 7 mutually perpendicular
% unit pure octonions.

% TODO See: Wikipedia: Seven-dimensional cross product where the discussion
% under Generalizations suggests that there should be a six-vector product.
% This does not seem consistent with Harvey. A critical issue is how to
% construct a 7-dimensional orthonormal basis. Surely this function is the
% key, but how should it work?

% TODO See also:
%
% W. S. Massey, Cross Products of Vectors in Higher Dimensional Euclidean Spaces
% The American Mathematical Monthly, Vol. 90, No. 10 (Dec., 1983), pp. 697-701
% http://www.jstor.org/stable/2323537

% $Id: vector_product.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
