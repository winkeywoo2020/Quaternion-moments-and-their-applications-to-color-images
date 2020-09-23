function [A, B] = cd(o)
% CD: returns two quaternions which are the Cayley-Dickson components
% of the octonion.

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(2, 2, nargout))

A = o.a; % The octonion is actually represented in this form, so the coding
B = o.b; % is trivial.

% $Id: cd.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
