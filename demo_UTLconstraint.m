clear;
% (1) load a data matrix for learning
% (2) generate a random matrix
n           =   8;
M           =   12;
dataMatrix  = randn(n, M)

%%%%%%%%%%%%%%%% UTL image denoising demo %%%%%%%%%%%%%%%%%%%%%
param.sig       =   sig;                            % sigma
param           =   getParam(param);     % parameters
% run UTL

% result
fprintf( 'UTL denoising completes! \n Denoised PSNR = %2.2f \n', psnrXr);  
figure; imshow(uint8(Xr));