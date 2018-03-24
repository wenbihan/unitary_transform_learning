function param = getParam(param)
%%%%%%%%%%%%%%%%% shared %%%%%%%%%%%%%%%%%%%%%%%
param.dim               =   8;
param.n                 =   param.dim * param.dim;
param.stride            =   1; 
%%%%%%%%%%%%%%%%% TL %%%%%%%%%%%%%%%%%%%%%%%
param.TLthr0            =   2.6;
param.learningIter      =   40;            % number of learning iterations\
param.threshold         =   param.TLthr0 * param.sig;
% initialize the transform as the 2D DCT
param.W                 =   kron(dctmtx(param.dim), dctmtx(param.dim));
% define non-linearity function (i.e., activation function)
% we use hard thresholding (i.e., minimizing l0 norm)
param.func              =   @(X, threshold) threshold_l0(X, threshold);
end