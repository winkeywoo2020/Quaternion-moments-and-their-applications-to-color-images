function tf = isfinite(A)
% ISFINITE  True for finite elements.  
% (Quaternion overloading of standard Matlab function.)

% Copyright © 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

if isempty(A.w)
    tf = isfinite(A.x) & isfinite(A.y) & isfinite(A.z);
else
    tf = isfinite(A.w) & isfinite(vee(A));
end

% $Id: isfinite.m,v 1.7 2010/12/19 17:10:26 sangwine Exp $
