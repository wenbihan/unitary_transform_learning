function param = getParam(param)
%%%%%%%%%%%%%%%%% shared %%%%%%%%%%%%%%%%%%%%%%%
param.dim               =   8;
param.n                 =   param.dim * param.dim;
param.stride            =   1; 
%%%%%%%%%%%%%%%%% TL %%%%%%%%%%%%%%%%%%%%%%%
param.TLthr0            =   2.6;
param.learningIter      =   40;            % number of learning iterations
% for denoising test
if isfield(param, 'sig')
    param.threshold         =   param.TLthr0 * param.sig;
    param.func              =   @(X, threshold) threshold_l0(X, threshold);
elseif isfield(param, 'sp')
    param.func              =   @(X, sp) proj_l0(X, sp);
end
% initialize the transform as the 2D DCT
param.W                 =   kron(dctmtx(param.dim), dctmtx(param.dim));
% define non-linearity function (i.e., activation function)
% we use hard thresholding (i.e., minimizing l0 norm)

end