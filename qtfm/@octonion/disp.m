function disp(o)
% DISP Display array.
% (Octonion overloading of standard Matlab function.)

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(1, 1, nargin)), error(nargoutchk(0, 0, nargout)) 

% The argument is not checked, since this function is called by Matlab only
% if the argument is an octonion.  There are three cases to be handled:
% empty, a pure octonion, a full octonion.  In the latter two cases,
% the fields may be arrays.

d = size(o);
S = blanks(5);
if isempty(o)
    if sum(d) == 0
        S = [S '[] octonion'];
    else
        S = [S 'Empty octonion'];
        l = length(d);
        if l == 2
            S = [S ' matrix: '];
        else
            S = [S ' array: '];
        end
        for k = 1:l
            S = [S, num2str(d(k))];
            if k == l
                break % If we have just added the last dimension, no need
                      % for another multiplication symbol.
            end
            S = [S, '-by-'];
        end
    end
elseif ndims(o) == 2 && d(1) == 1 && d(2) == 1
    % Scalar case.    
    S = [S char(o)];
else
    % Non-scalar case. Build up the string piece by piece, then output it
    % when complete.

    l = length(d);
    for k = 1:l
        S = [S, num2str(d(k))];
        if k == l
            break % If we have just added the last dimension, no need for
                  % another multiplication symbol.
        end
        S = [S, 'x'];
    end
    if isempty(s(o.a)), S = [S, ' pure'];    end
    if ~isreal(o),      S = [S, ' complex']; end
                        S = [S, ' octonion array'];
                           
    % Add some information about the components of the octonion, unless
    % the component type is double (the default - implied).
    
    a = o.a; % Get the first quaternion component of o.
    C = class(a.x); % Access the x component to determine the class of the
                    % components.
    if ~strcmp(C, 'double')
        S = [S, ' with ', C, ' components'];
    end
end
disp(S)

% $Id: disp.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
