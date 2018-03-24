function X = threshold_l0(X, threshold)
%threshold_l0 Summary of this function goes here
% small trick: preserve the largest magnitude
[~, maxInd]     =   max(abs(X));
maxVal          =   X(maxInd);
X(abs(X) < threshold)   =   0;
X(maxInd)               =   maxVal;
end

