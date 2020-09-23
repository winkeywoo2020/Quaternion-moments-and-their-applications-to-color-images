function tf = isempty(q)
% ISEMPTY True for empty matrix.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.
     
tf = isempty(q.a);
if tf
    assert(isempty(q.b));
end

% $Id: isempty.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
