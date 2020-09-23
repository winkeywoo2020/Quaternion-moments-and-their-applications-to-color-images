function r = subsasgn(a, ss, b)
% SUBSASGN Subscripted assignment.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

switch ss.type
case '()'
    if length(ss) ~= 1
        error('Multiple levels of subscripting are not supported for octonions.')
    end
    
    if ~isa(a, 'octonion')
        error('Left side must be an octonion in subscripted assignment if right side is an octonion.')    
    end

    if ~isa(b, 'octonion')

           % Argument a (the left-hand side of the assignment) is an octonion,
           % but b (the right-hand side) is not (it could be double, for example,
           % zero). To handle this case, we need to convert b to an octonion.

           if ispure(a)
               error('Cannot convert right-hand argument to a pure octonion.');
           else
               if isnumeric(b)
                   r = subsasgn(a, ss, octonion(b)); % Convert b to an octonion (with implicit
                   return                            % zero vector part), and call recursively.
               else
                   error('Cannot convert non-numeric right-hand argument to an octonion.');
               end
           end
    end
    
    pa = ispure(a);
    if pa ~= ispure(b)
        error('Left and right sides in subscripted assignment must both be pure, or both full octonions.')
    end
    
    % To perform subscripted assignment, we split the octonion into two
    % quaternions and operate on the two quaternions separately. Finally we
    % re-assemble the two quaternion results to make the octonion result.
    
    r = a; % Copy the input array to create an octonion result.
    r.a = subsasgn(a.a, ss, b.a); % These calls are to the quaternion
    r.b = subsasgn(a.b, ss, b.b); % subsagn function, of course.
case '{}'
    error('Cell array indexing is not valid for octonions.')
case '.'
    error('Structure indexing is not implemented for octonions.')
otherwise
    error('Octonion subsasgn received an invalid subscripting type.')
end

% $Id: subsasgn.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
