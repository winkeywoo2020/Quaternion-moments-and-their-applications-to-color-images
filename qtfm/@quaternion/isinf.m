function tf = isinf(A)
% ISINF  True for infinite elements.  
% (Quaternion overloading of standard Matlab function.)

% Copyright © 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 1, nargout))

if isempty(A.w)
    tf = isinf(A.x) | isinf(A.y) | isinf(A.z);
else
    tf = isinf(A.w) | isinf(vee(A));
end

% $Id: isinf.m,v 1.6 2010/12/19 17:10:39 sangwine Exp $
