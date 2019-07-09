function [W, X]= UTLconstraint(W, Y, numiter, sparsity)
%Core Code for unitary transform learning with sparsity constraint
% author:       Bihan Wen
% updated:      July 9, 2019
% Inputs:
%   W   -   sparsifying transfrom
%   Y   -   data matrix
%   numiter     -   number of iterations for transform learning
%   sparsity   -   threshold for thresholding
% Ouputs:
%   W   -   updated transform
%   X   -   sparse codes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = size(Y, 1);
for i=1:numiter
    % sparse coding
    X = W * Y;
    X = nonlinearFunc(X, sparsity);
    % unitary transform update, closed-form 
    [U, ~, V] = svd(Y * X');
    W = (V(:,1:n))*U';    
end
% one more sparse coding, after transform is finalized
X = W * Y;
X = nonlinearFunc(X, sparsity);