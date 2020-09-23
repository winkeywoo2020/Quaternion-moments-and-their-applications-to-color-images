function [L, U, P] = lu(A)
% LU decomposition.
% (Octonion overloading of standard Matlab function.)

% TODO The code here is a copy of the quaternion code. Since it did not
% need modification, we need only have one function for both cases. Could
% put this code into a common folder and call it from two simple lu
% functions, one for q and one for o. Think about best way to do this.
% Ditto for the qr, except that the qr code doesn't work properly for
% octonions.

% Copyright © 2010, 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(2, 3)

[m, n] = size(A);

N = min(m, n); % The number of elements on the diagonal of A.

P = eye(m); % This may not be needed as a return result, but it is needed
            % internally even if not returned.

% Reference:
%
% Algorithm 3.2.1, section 3.2.6, modified along the lines of section
% 3.2.11 of:
% Gene H. Golub and Charles van Loan, 'Matrix Computations', 3rd ed,
% Johns Hopkins University Press, 1996.

% The code below handles all three cases, m > n, m == n and m < n.

for j = 1:N
    
    % Partial pivoting: place the largest diagonal element in j:N at
    % position j (taking largest to mean largest modulus) by swapping rows.
    % We use abs twice so that the modulus of a complex octonion array A
    % yields a real result, so the code will work for complexified arrays.
        
    % TODO Replace D here with ~. However, this change will require Matlab
    % 7.9 R2009b minimum, (See 'Ignore Selected Arguments on Function
    % Calls' in the Release Notes). The file test/test_version.m will
    % need to be updated to reflect this dependence if this is ever done.
    
    [D, k] = max(abs(abs(diag(subsref(A, substruct('()', {j:N, j:N})))))); %#ok<ASGLU>
    if k ~=1 % If k == 1, the largest element is already at A(j, j).
        % Swap rows j and j + k - 1 in both A and P.
        l = j + k - 1;
        P([j l], :) = P([l j], :);
        r1 = substruct('()', {[j l], ':'});
        r2 = substruct('()', {[l j], ':'});
        A = subsasgn(A, r1, subsref(A, r2)); % A([j l], :) = A([l j], :)
    end
    
    if j == m, break, end % If true, j+1:m would be an empty range.
    s1 = substruct('()', {j,     j});
    s2 = substruct('()', {j+1:m, j});
    %A(j+1:m, j) = A(j+1:m, j) ./ A(j, j);
    A = subsasgn(A, s2, subsref(A, s2) ./ subsref(A, s1));
    
    if j == n, break, end % If true, j+1:n would be an empty range.
    s3 = substruct('()', {j+1:m, j+1:n});
    s4 = substruct('()', {j,     j+1:n});
    %A(j+1:m, j+1:n) = A(j+1:m, j+1:n) - A(j+1:m, j) * A(j, j+1:n);
    A = subsasgn(A, s3, subsref(A, s3) - subsref(A, s2) * subsref(A, s4));
end

% The algorithm above computes L and U in place, so extract them into the
% separate results demanded by the calling profile. The diagonal of L is
% implicit in the result produced above, so we have to supply the explicit
% values which are all ones.

% L has size [m, N],     where N = min(m, n), the number of elements on the
% U has size [N, n]      diagonal of A.

U = triu(subsref(A, substruct('()', {1:N, ':'})));          % A(1:N, :)
L = tril(subsref(A, substruct('()', {':', 1:N})), -1) + ... % A(:, 1:N)
    eye(m, N, class(component(A, 2)));

if nargout < 3
    % The third output parameter is not needed, therefore we must modify L.
    % This behaviour matches that of the Matlab LU function. It ensures
    % that A == L * U, rather than P * A == L * U, which is the case if P
    % is returned.
    L = P.' * L; % TODO Could this be done by row swaps rather than * ?
end

% Note on subscripted references: these do not work inside a class method
% (which this is). See the file 'implementation notes.txt', item 8.

% $Id: lu.m,v 1.2 2013/04/02 16:25:48 sangwine Exp $
