function compare(A, B, T, E)
% Test function to check that two quaternion arrays (real or complex)
% are equal, to within a tolerance, and if not, to output an error
% message from the string in the parameter E. (This will also work for
% non-quaternion arrays.)

% Copyright © 2005, 2006, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(4, 4, nargin)), error(nargoutchk(0, 0, nargout)) 

if any(any( abs(abs(A - B)) > T ))
    max(max(abs(abs(A - B)))) % Added 13 March 2006 to show the max error.
    error(E);
end

% $Id: compare.m,v 1.5 2010/03/12 13:18:49 sangwine Exp $
