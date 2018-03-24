clear;
load('demo_data/Baby_sigma20.mat');
% sig         =   20;
% oracle      =   double(imread(demo_data/kodim08.png'));
% noisy       =   oracle + randn(size(oracle)) * sig;

%%%%%%%%%%%%%%%% strollr2D image denoising demo %%%%%%%%%%%%%%%%%%%%%
param.sig       =   sig;                            % sigma
param           =   getParam(param);     % parameters
% run denoising
[Xr, psnrXr]    =   UTL_imagedenoising(noisy, param, oracle);
% result
fprintf( 'UTL denoising completes! \n Denoised PSNR = %2.2f \n', psnrXr);  
figure; imshow(uint8(Xr));