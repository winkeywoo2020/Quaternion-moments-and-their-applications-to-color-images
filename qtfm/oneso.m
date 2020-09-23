function E = oneso(varargin)
% ONESO   Octonion matrix of ones. Takes the same parameters as the
% Matlab function ONES (q.v.). NB: The vector part is zero, not ones.

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

E = octonion(ones(varargin{:}));

% $Id: oneso.m,v 1.1 2013/03/26 15:10:22 sangwine Exp $

