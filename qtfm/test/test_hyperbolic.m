function test_hyperbolic
% Test code for the quaternion sinh and cosh functions.

% Copyright © 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

disp('Testing hyperbolic functions ...');

T = 1e-11;

% Test 1. Real quaternion data.

q = quaternion(randn(100,100), randn(100,100), randn(100,100), randn(100,100));

compare(sinh(q).^2 - cosh(q).^2, -ones(100,100), T,...
    'quaternion/sinh/cosh failed test 1.');

% Test 2. Complex quaternion data.

b = quaternion(complex(randn(100,100)),complex(randn(100,100)),...
               complex(randn(100,100)),complex(randn(100,100)));

compare(sinh(b).^2 - cosh(b).^2, -ones(100,100), T,...
    'quaternion/sinh/cosh failed test 2.');

disp('Passed');

% $Id: test_hyperbolic.m,v 1.5 2010/05/12 21:08:12 sangwine Exp $

