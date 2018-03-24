function [W, sparseCode, sparsityLevel] = ...
    module_TLapprox(extractPatchAll, W, param)
%MODULE_TLAPPROX Summary of this function goes here
%   generate the sparse codes and learn transform
%   Inputs:
%       1. W                    : initial Transform
%       2. extractPatchAll      : the n * N data
%       3. param                : transform learning parameters
%   Outputs:
%       1. W                    : learned transform
%       2. sparseCode           : generated sparse codes
%       3. nonZeroTable         : #non-zeros for each patch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% Parameters %%%%%%%%%%%%%%%
learningIter                =   param.learningIter;
threshold                   =   param.threshold;
nonlinearFunc               =   param.func;
%%%%%%%%%%%%%%% Main Program %%%%%%%%%%%%%%%
[W, sparseCode]             =   UTLpenalty(W, extractPatchAll, learningIter, nonlinearFunc, threshold);
% if sparsity level is needed
if nargout == 3   
    sparsityLevel   =   sum(abs(sparseCode) > 0);
end
end

