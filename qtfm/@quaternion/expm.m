function Y = expm(X)
% Matrix exponential.
% (Quaternion overloading of standard Matlab function.)

% Copyright © 2008, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

Y = overloadm(mfilename, X);

% TODO Implement a more accurate dedicated algorithm for this function. A
% possible candidate is perhaps given in one of the two articles referenced
% by the Matlab documentation page on expm (Moler and van Loan, 1978/2003;
% or Higham, 2005).

% $Id: expm.m,v 1.5 2011/01/05 18:13:37 sangwine Exp $
