function n = ndims(o)
% NDIMS   Number of array dimensions.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

n = ndims(o.a); % Call the quaternion ndims on the first quaternion part.
                % (The second quaternion must have the same ndims result.)
% $Id: ndims.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
