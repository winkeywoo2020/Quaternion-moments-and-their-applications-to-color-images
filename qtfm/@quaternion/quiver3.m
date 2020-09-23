function h = quiver3(O, P, varargin)
% QUIVER3  Display pure quaternion array as 3D quiver plot
% (Quaternion overloading of standard Matlab function.)
%
% Takes the same parameters as the Matlab function of the same name, except
% that the first six parameters (X, Y, Z, U, V, W) are replaced by two
% quaternion parameters, which must be pure quaternion vectors. For more
% sophisticated requirements, use the Matlab function and pass the X, Y and
% Z components of the quaternion array as the first three parameters.

% Copyright © 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargoutchk(0, 1, nargout))

for k = 1:length(varargin)
    if isa(varargin{k}, 'quaternion')
        error('Only the first two parameters are permitted to be quaternions.')
    end
end

if nargin == 1
    % There is only one quaternion parameter.
    
    if ~isempty(O.w)
        error('Quaternion array must be pure.')
    end
    
    % Since there is only one parameter, we assume zero for the origin.
    
    O = O(:); % This is a Matlab trick to convert an array of any number of
              % dimensions into a vector.
              
    Z = zeros(size(O));
    if nargout == 0
        quiver3(Z, Z, Z, O.x, O.y, O.z);
    else
        h = quiver3(Z, Z, Z, O.x, O.y, O.z);
    end
    return
end

% From here there must be at least two input parameters.

if ~isempty(O.w) || ~isempty(P.w)
    error('Quaternion arrays must be pure.')
end

if any(size(O) ~= size(P))
    error('The two quaternion arrays must have the same size.');
end

if ~isvector(O)
    O = O(:); % If O isn't a vector P isn't either, because we checked that
    P = P(:); % the sizes matched just above.
end

if isempty(varargin)
    if nargout == 0
        quiver3(O.x, O.y, O.z, P.x, P.y, P.z);
    else
        h = quiver3(O.x, O.y, O.z, P.x, P.y, P.z);
    end
    return
end

% TODO Consider how to include RGB colouring cf scatter3.m.

% $Id: quiver3.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
