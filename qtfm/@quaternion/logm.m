function L = logm(A)
% Matrix logarithm.
% (Quaternion overloading of standard Matlab function.)

% Copyright © 2008, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

L = overloadm(mfilename, A);

% TODO Tests have shown that this function sometimes returns a totally
% incorrect result, reason unknown. The problem seems to be more common
% with larger matrices (starting at around 8-by-8). As a result, the
% following will not be close to a zero matrix: logm(expm(A))-A

% TODO Implement a more accurate dedicated algorithm for this function.

% $Id: logm.m,v 1.5 2011/01/05 18:14:04 sangwine Exp $
