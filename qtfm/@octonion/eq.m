function tf = eq(l, r)
% ==  Equal.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(0, 1, nargout)) 

if isa(l, 'octonion') && isa(r, 'octonion')
    
  tf = (l.a == r.a) & (l.b == r.b);
    
else
    % One of the arguments is not an octonion (the other must be, or Matlab
    % would not call this function). The non-octonion argument must be a
    % numeric (if we don't impose this restriction it could be anything
    % such as a cell array or string which makes no sense at all to compare
    % with).
    
    % TODO There is a problem here if the operands have different sizes, a
    % problem which doesn't seem to occur with the quaternion eq.m. In the
    % quaternion code, automatic promotion of a scalar occurs, but perhaps
    % here this isn't possible?
    
    if isa(l, 'octonion') && isa(r, 'numeric')
        tf = (l.a == r) & (l.b == 0);
    elseif isa(l, 'numeric') && isa(r, 'octonion')
        tf = (l == r.a) & (0 == r.b);
    else
        if isa(r, 'quaternion') || isa(l, 'quaternion')
            error('Cannot compare an octonion with a quaternion')
        else
            error('Cannot compare an octonion with a non-numeric');
        end
    end
end

% $Id: eq.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
