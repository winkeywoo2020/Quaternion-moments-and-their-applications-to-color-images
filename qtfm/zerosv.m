function E = zerosv(varargin)
% ZEROSV   N-by-N pure quaternion matrix of zeros. Takes the same
% parameters as the Matlab function ZEROS (q.v.).

% Copyright © 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

E = quaternion(zeros(varargin{:}), zeros(varargin{:}), zeros(varargin{:}));

% $Id: zerosv.m,v 1.2 2009/02/08 19:18:16 sangwine Exp $

