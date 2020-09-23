% Test script for the Quaternion Toolbox for Matlab.

% Copyright © 2005, 2006, 2009, 2010, 2013
% Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

% This script runs a series of test functions, each designed to test one
% or more functions in the toolbox. No errors should be generated and the
% script should run to completion. The first functions run are designed to
% verify the installation and environment before running the tests proper.

copyright; % Display the copyright notice.

test_version;
test_path;

% Output some diagnostic information about where the test code is running
% from, for use in diagnosing problems reported by users who may have paths
% and so on set up incorrectly.

v = ver('qtfm');
disp(['QTFM version number reported as : ', v.Version])
clear v
disp(['QTFM root directory reported as : ', qtfm_root])
disp(['Running test code from directory: ', pwd])
if strcmp(pwd, [qtfm_root, filesep, 'test']) == 0
    error('Test code is not running from the qtfm root/test directory.')
end

% Check that quaternion function dot.m has been deleted. (This function
% was renamed scalar_product after release 1.0, because the dot function
% in Matlab computes an inner product of two vectors, and QTFM should be
% consistent with this.)

if dot(qi,qj) == 0
    error('QTFM file dot.m from previous releases must be deleted.');
end;

% Now run the tests. The sequence is important, in order to test simple
% functionality first, before testing more complex functions that depend on
% the simpler ones.

tic;
disp('Testing quaternion code ...')
test_fundamentals;
test_overloads;
test_sum_diff;
test_adjoint;
test_sqrt
test_cd
test_exp
test_log
test_mat
test_power
test_slerp
test_trigonometric
test_inverse_trig
test_hyperbolic
test_inverse_hyperbolic
test_isocomplex
test_orthonormal
test_inv
test_qdft
test_qfft
test_fft
test_svd
test_svdj
test_eig
test_conv
test_lu
test_qr
disp('Testing of quaternion code completed.')
disp('Testing octonion code ...')
test_octonion
disp('Test of octonion code completed.')
toc

disp('All tests completed without error.')

% $Id: test.m,v 1.26 2013/03/26 15:51:54 sangwine Exp $
