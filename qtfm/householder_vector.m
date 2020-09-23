function [u, zeta] = householder_vector(a, v)
% [u, zeta] = householder_vector(a, v) calculates a Householder vector,
% u, with a norm of sqrt(2), and a value zeta, from the vectors a and v. The
% results may be used to construct a left or right Householder matrix and they
% depend on whether the input parameters are column or row vectors respectively.
% The result returned in u has the same type (row, column) as the parameter a.
% zeta will be real, complex or quaternion, depending on the type of a.
% The parameter v must be real (mathematical limitation).

% Copyright © 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(2, 2, nargout))

if size(a) ~= size(v)
    error('Input parameters must be vectors of the same size, both row, or both column')
end

if isa(v, 'quaternion')
    error('Parameter v may not be a quaternion vector (mathematical limitation)')
end

[m, n] = size(a);

col_vector = n == 1 & m == length(a); % TODO This could be changed to use
row_vector = m == 1 & n == length(a); % isrow and iscolumn (7.11 R2010b).

if col_vector == 0 && row_vector == 0
    error('Parameters must be either column or row vectors.');    
end

% References:
%
% Alston S. Householder, Unitary Triangularization of a Nonsymmetric Matrix,
% J. ACM, 5 (4), 1958, pp339--342.
% DOI:10.1145/320941.320947
%
% David D. Morrison,
% Remarks on the Unitary Triangularization of a Nonsymmetric Matrix,
% J. ACM, 7 (2), 1960, pp185--186.
% DOI:10.1145/321021.321030
%
% Sangwine, S. J. and Le Bihan, N.,
% Quaternion singular value decomposition based on bidiagonalization
% to a real or complex matrix using quaternion Householder transformations,
% Applied Mathematics and Computation, 182(1), 1 November 2006, 727-738, 
% DOI:10.1016/j.amc.2006.04.032.
%
% S. J. Sangwine and N. Le Bihan,
% Quaternion Singular Value Decomposition based on Bidiagonalization
% to a Real Matrix using Quaternion Householder Transformations,
% arXiv:math.NA/0603251, 10 March 2006. Available at http://www.arxiv.org/.

alpha = norm(a);

if alpha == 0
    u = a - a; % This ensures that u is zero, even if a is a
               % complex quaternion vector with zero norm.
    zeta = 1;
    return;
end

if col_vector
   romega = a.' * v;
else
   romega = v * a.';
end

r = abs(romega);

if r ~= 0
    zeta = -romega ./ r;
else
    zeta = 1;
end

mu = sqrt(alpha .* (alpha + r)); % assert(isa(mu, 'float'));

if col_vector
    u = (a - (zeta .* v) .* alpha) ./ mu;
else
    u = conj(alpha .* (v .* zeta) - a) ./ mu;
end

% TODO This function offers scope for performance improvement. In
% particular:
%
% v is normally mostly zero. Is it not possible to avoid all the
% multiplications by zero in zeta .* v .* alpha?

% $Id: householder_vector.m,v 1.7 2013/03/26 15:15:42 sangwine Exp $
