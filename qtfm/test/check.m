function check(L, E)
% Test function to check a logical condition L, and output an error
% message from the string in the parameter E if false. L may be a vector,
% in which case, all its elements are required to be true.

% Copyright © 2005, 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(0, 0, nargout)) 

if ~islogical(L)
    error('First parameter must be logical.');
end

if ~all(L)
    error(E);
end

% $Id: check.m,v 1.3 2009/02/08 19:18:16 sangwine Exp $

