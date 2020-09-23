function t = sum(a, dim)
% SUM Sum of elements.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 2, nargin)), error(nargoutchk(0, 1, nargout))

if nargin == 1
    t = overload(mfilename, a);
else
    if ischar(dim)
        if (strcmp(dim, 'double') || strcmp(dim, 'native'))
            error(['Parameters ''double'' or ''native'' are not'...
                   ' implemented in the octonion sum function.']);
        else
            error('Dimension argument must be numeric');
        end
    end
    
    if ~isnumeric(dim)
        error('Dimension argument must be numeric');
    end
    
    if ~isscalar(dim) || ~ismember(dim, 1:ndims(a))
        error(['Dimension argument must be a positive'...
               ' integer scalar within indexing range.']);
    end
    
    t =  overload(mfilename, a, dim);
end

% $Id: sum.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
