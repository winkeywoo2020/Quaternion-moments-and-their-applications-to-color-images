function c = conj(a, F)
% CONJ   Octonion conjugate.
% (Octonion overloading of Matlab standard function.)
%
% Implements three different conjugates:
%
% conj(X) or
% conj(X, 'cayley')  returns the octonion conjugate.
% conj(X, 'complex') returns the complex conjugate.
% conj(X, 'total')   returns the 'total' conjugate equivalent to
%                    conj(conj(X, 'complex'), 'cayley')

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 2, nargin)), error(nargoutchk(0, 1, nargout))

if nargin == 1
    F = 'cayley'; % Supply the default parameter value.
end

if ~strcmp(F, 'cayley') && ~strcmp(F, 'complex') && ~strcmp(F, 'total')
    error('Second parameter value must be ''cayley'', ''complex'' or ''total''.')
end

c = a; % Copy the parameter in order to create an octonion result.

switch F
    case 'cayley'
        c.a = conj(c.a); % The quaternion conjugate, of course, which
                         % negates all but the scalar part.
        c.b = - c.b;     % Negate the other four components.
    case 'complex'
        c.a = conj(c.a, F); % Take the complex conjugate of each quaternion
        c.b = conj(c.b, F); % component.
    case 'total'
        c = conj(conj(a, 'complex'), 'cayley');
    otherwise
        error('Bad value for second parameter.');
end

% $Id: conj.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
