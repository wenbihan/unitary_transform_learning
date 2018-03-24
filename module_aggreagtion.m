function Xr = module_aggreagtion(patches, weights, param)
%MODULE_AGGREAGTION Summary of this function goes here
%   Goal:   Aggregate the patches back to the images (shrinking) with weights
%   Inputs:
%       1. patches              : reconstructed patches
%       2. weights              : weights for LRpatch
%       3. param                : parameters for reconstruction
%   Outputs:
%       1. Xr                   : reconstructed image by patch aggregation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% parameters %%%%%%%%%%%%%%%%%%%%%%
height              =   param.height;
width               =   param.width;
dim                 =   param.dim;
Mimage              =   height - dim + 1;
Nimage              =   width - dim + 1;
r                   =   1 : Mimage;
c                   =   1 : Nimage;
im_out              =   zeros(height, width);
im_wei              =   zeros(height, width);
k                   =   0;
weightMat           =   reshape( weights', [Mimage Nimage]);
%%%%%%%%%%%%%%% Aggregation %%%%%%%%%%%%%%
for i  = 1 : dim
    for j  = 1 : dim
        k    =  k + 1;
        im_out(r-1+i, c-1+j)  =  im_out(r-1+i,c-1+j) + ...
            reshape( patches(k,:)', [Mimage Nimage]) .* weightMat;
        im_wei(r-1+i,c-1+j)  =  im_wei(r-1+i,c-1+j) + weightMat;
    end
end
Xr                  =   im_out./(im_wei + eps);
end

