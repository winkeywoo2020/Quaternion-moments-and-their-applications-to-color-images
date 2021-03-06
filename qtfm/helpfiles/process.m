% Script to process XML help files into HTML. This script can be invoked
% from the Matlab Start button (via the function qftm_helpup).
%
% Copyright � 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

L = {'abs'  'acos' 'acosh' 'adjoint' 'angle'...
     'arrayfun' ...
     'asin' 'asinh' 'associator' 'atan' 'atanh'    'axis'...
     'blkdiag' 'bsxfun'...
     'cast' 'cat' 'cd' 'cdpolar' 'ceil' 'change_basis' 'char' ...
     'commutator' 'complex' 'conj' 'conv' 'conv2' 'convert' ...
     'cos' 'cosh' 'cross' 'ctranspose' 'cumprod' 'cumsum' ...
     'dc' 'det' 'diag' 'diff' 'disp' 'display' 'displayall' ...
     'eig' 'end' 'eq' 'exp' 'expm' 'eyeq' ...
     'fft' 'fft2' 'fftshift' 'fix' 'floor' 'fprintf' 'frenet' 'full' 'funm' ...
     'horzcat' ...
     'ifft' 'ifft2' 'ifftshift' 'iqdft' 'iqdft2' 'iqfft' 'iqfft2' ...
     'imag' 'image' 'imreadq' 'imwrite' ...
     'inv' 'ipermute' 'isempty' 'isfinite' 'ishermitian' 'isinf' ...
     'isnan' 'ispure' 'isreal' 'isunitary' ...
     'ldivide' 'length' 'linv' 'log' 'logm' 'lu' ...
     'mean' 'minus' 'mpower' 'mrdivide' 'mtimes' ...
     'ndims' 'ne' 'norm' 'normo' 'normq' 'numel' ...
     'o1' 'octonion' 'onesq' 'orthogonal' 'orthonormal_basis' ...
     'part' 'permute' 'plus' 'power' 'prod' ...
     'q1' 'quaternion' 'qdft' 'qdft2' 'qfft' 'qfft2' 'qr' ...
     'qtfm_root' 'qtfm_test' ...
     'randf' 'rando' 'randq' 'randv' 'randvo' 'randvmf' 'read' 'repmat' 'reshape' ...
     'rdivide' 'real' 'rinv' 'round' ...
     's' 'scalar_product' 'scatter3' 'scatter4' ...
     'show' 'sign' 'sin' 'sinh' 'size' ...
     'slerp' ...
     'sum' 'sqrt' 'sqrtm' 'squeeze' 'subsasgn' 'subsindex' 'subsref' ...
     'svd' 'svdj'...
     'tan' 'tanh' 'times' 'transpose' 'tril' 'triu' ...
     'uminus' 'unadjoint' 'uplus' 'unit' ...
     'v' 'vector_product' 'vertcat' ...
     'write' ...
     'xyz' ...
     'zeroso' 'zerosq' 'zerosv' 'zerosvo'};

S = 'xmlfiles/qtfmfunction.xsl';

h = waitbar(0, 'Processing XML to HTML helpfiles ...');

N = length(L);

for i = 1:N
    F = L{i};
    waitbar(i/N, h)
    xslt(['xmlfiles/', F, '.xml'], S, [F, '.html']);
end
close(h)

% $Id: process.m,v 1.13 2013/03/26 15:46:54 sangwine Exp $
