function h = text(q, s)
% TEXT  Display text string on 3D plot
% (Quaternion overloading of standard Matlab function.)
%
% Takes the same parameters as the Matlab function of the same name, except
% that the first three parameters (X, Y, Z) are replaced by a quaternion,
% which must be a pure quaternion. Plots the text string given on the
% current plot (which must be a 3D plot).

% Copyright © 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(0, 1, nargout))

if isa(s, 'quaternion')
    error('Only the first parameter is permitted to be a quaternion.')
end

if ~isempty(q.w)
    error('Quaternion array must be pure.')
end

if ~isscalar(q)
    error('Quaternion parameter must be a scalar, not an array.')
end

if ~ischar(s)
    error('Second parameter must be a character array (string).')
end

if nargout == 0
    text(q.x, q.y, q.z, s);
else
    h = text(q.x, q.y, q.z, s);
end

% TODO Debug this code.

% $Id: text.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
