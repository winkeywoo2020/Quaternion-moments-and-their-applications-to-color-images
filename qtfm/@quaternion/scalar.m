function x = scalar(q)
% SCALAR   Quaternion scalar part.
%
% This function returns zero in the case of pure quaternions,
% whereas the function S gives an error if q is pure.

% Copyright © 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

if isempty(q.w)
    
    % The class function here is used to ensure that the zeros returned
    % have the same type as the components of q, so that if, for example, q
    % is a quaternion with int8 components, x will be returned as an array
    % of int8 zeros.
    
    x = zeros(size(q), class(q.x));
else
    x = q.w;
end

% $Id: scalar.m,v 1.7 2010/11/04 21:54:32 sangwine Exp $
