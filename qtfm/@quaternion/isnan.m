function tf = isnan(A)
% ISNAN  True for Not-a-Number.
% (Quaternion overloading of standard Matlab function.)

% Copyright © 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

if isempty(A.w)
    tf = isnan(A.x) | isnan(A.y) | isnan(A.z);
else
    tf = isnan(A.w) | isnan(vee(A));
end

% $Id: isnan.m,v 1.6 2010/12/19 17:10:39 sangwine Exp $
