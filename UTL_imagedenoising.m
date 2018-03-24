function [Xr, psnrXr] = UTL_imagedenoising(noisy, param, oracle)
%Function for denoising the gray-scale image using unitary transform
%learning
%
% The UTL_imagedenoising algorithm is used in our ICASSP 2017 paper, please
% cite the following paper if you use this implementation in your work.
%
% (1)  "When Sparsity Meets Low-Rankness: Transform Learning With Non-Local 
%      Low-Rank Constraint for Image Restoration,”, written by B. Wen, Y.
%      Li, and Y Bresler, in Proc. IEEE Int. Conf. on Acoustics, Speech and
%      Signal Processing (ICASSP), pp. 2297-2301, March. 2017. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs -
%       1. noisy: a*b size gray-scale matrix for denoising
%
%       2. param: Structure that contains the parameters of the
%       OCTOBOS_imagedenoising algorithm. The various fields are as follows
%       -
%                   - dim: Patch size
%                   - stride: stride of overlapping patches
%                   - BMstride: stride of patches for block matching
%                   - TLthr0: sparsity penalty coefficient
%                   - learningIter: number of iterations of transform
%                           learning
%                   - searchWindowSize: size of the local search window
%                   - tensorSize: tensor (matrix) size for low-rank approximation
%                   - thr0: rank penalty term coefficient
%
%       3. oracle (optional): a*b size gray-scale matrix as
%                   ground-true, which is used to calculate PSNR
% Outputs -
%       1. Xr - Image reconstructed with OCTOBOS_imagedenoising algorithm.
%       2. psnrXr - PSNR value of the denoised image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PatchSize           =   param.dim; 
W                   =   param.W;
patches             =   module_im2patch(noisy, PatchSize);  
[param.height, param.width]         =   size(noisy);

% Transform Learning
[W, sparseCode, sparsityLevel]  =   module_TLapprox(patches, W, param);
score                           =   1 ./ (sparsityLevel + 0.5);
patchRecon                      =   W' * sparseCode;
patchRecon(patchRecon>255) = 255;
patchRecon(patchRecon<0) = 0;
% Denoised patch aggregation
Xr                  =   module_aggreagtion(patchRecon, score, param);
if nargin == 3
    psnrXr              =   PSNR3D(Xr - oracle);
end
end

