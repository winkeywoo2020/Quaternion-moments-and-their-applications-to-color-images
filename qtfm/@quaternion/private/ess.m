function x = ess(q)
% Extracts the scalar component of a full quaternion. If q is a pure
% quaternion, an error is raised, since the scalar part of a pure
% quaternion should not be extracted.

% Copyright © 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

error('Obsolete private function ess called.')

if isempty(q.w)
    error('The scalar part of a pure quaternion is not defined.');
end

x = q.w;

% $Id: ess.m,v 1.3 2010/05/13 20:33:55 sangwine Exp $
