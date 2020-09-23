function E = eyeq(varargin)
% EYEQ   N-by-N quaternion identity matrix. Takes the same parameters as
% the Matlab function EYE (q.v.).

% Copyright © 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

E = quaternion(eye(varargin{:}));

% $Id: eyeq.m,v 1.3 2012/01/01 19:08:14 sangwine Exp $
