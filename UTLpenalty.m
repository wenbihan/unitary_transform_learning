function [W, X]= UTLpenalty(W, Y, numiter, nonlinearFunc, threshold)
%Core Code for unitary transform learning
% author:       Bihan Wen
% updated:      March 24, 2018
% Inputs:
%   W   -   sparsifying transfrom
%   Y   -   data matrix
%   numiter     -   number of iterations for transform learning
%   threshold   -   threshold for thresholding
% Ouputs:
%   W   -   updated transform
%   X   -   sparse codes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = size(Y, 1);
for i=1:numiter
    % sparse coding
    X = W * Y;
    X = nonlinearFunc(X, threshold);
    % unitary transform update, closed-form 
    [U, ~, V] = svd(Y * X');
    W = (V(:,1:n))*U';    
end
% one more sparse coding, after transform is finalized
X = W * Y;
X = nonlinearFunc(X, threshold);