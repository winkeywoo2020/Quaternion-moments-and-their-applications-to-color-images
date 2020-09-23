function n = numel(o, varargin)
% NUMEL   Number of elements in an array or subscripted array expression.
% (Octonion overloading of standard Matlab function.)
%
% NOTE THAT this function does not return the number of octonions in the
% array o. This can be obtained easily by prod(size(o)). The reason for
% this is complex, but connected with the way Matlab implements subscripted
% indexing. See the notes in the Matlab documentation for the numel
% function.

% Copyright © 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

if isempty(o)
    n = 0; return % Return zero for an empty octonion array.
end

if nargin == 1
    n = builtin('numel', o);
else
    % We have more than one argument. This means varargin represents a
    % list of index values. See the Matlab help documentation on the
    % numel function for a detailed (if unclear!) explanation of what
    % numel has to do. It appears that this function should never be
    % called with this parameter profile (Matlab should call the built-in
    % numel function instead), so we trap any call that does occur.

    error('Octonion numel function called with varargin, unexpected.');

    % If we do have to handle this case, here is how it could be done:
    % n = numel(o.x, varargin);
end

% $Id: numel.m,v 1.1 2013/03/26 15:10:23 sangwine Exp $
