function p = convert(q, t)
% CONVERT Convert elements of a quaternion to another type.
% See also cast, which overloads the standard Matlab function.
%
% This function converts a quaternion array into a quaternion array with
% components of a different data type (e.g. int8, double, single).

% Copyright © 2006, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error(nargchk(2, 2, nargin)), error(nargoutchk(0, 1, nargout))

if ~ischar(t)
    error('Second parameter must be a string.')
end

f = str2func(t); % Construct a function handle from t, which must denote
                 % a function on the current Matlab path, so if it does
                 % not, an error will occur here.
if isempty(q.w)
    p = quaternion(        f(q.x), f(q.y), f(q.z));
else
    p = quaternion(f(q.w), f(q.x), f(q.y), f(q.z));
end

% $Id: convert.m,v 1.7 2010/12/19 17:09:51 sangwine Exp $
