function [out] =  two_scale(I1,I2)
imgYUV = rgb2yuv(I1);
%% base
sigma = 5;% sigma
baseI1 = gaussFilter(imgYUV(:,:,1),sigma);
baseI2 = gaussFilter(I2,sigma);
weight1 = Visual_Weight_Map(imgYUV(:,:,1));% weight map
weight2 = Visual_Weight_Map(I2);
% figure;imshow(weight1);figure;imshow(weight2);
BF = (0.5+0.5*(weight1-weight2)).*baseI1 + (0.5+0.5*(weight2-weight1)).*baseI2;
% figure;imshow(baseI1);figure;imshow(baseI2);
% figure;imshow(BF)
%% detail
detailI1 = imgYUV(:,:,1) - baseI1;
detailI2 = I2 - baseI2;
c = double(abs(detailI1) < abs(detailI2));% max absolute
DF = c.*detailI2 + (1-c).*detailI1;
%% 
fused = BF + DF;
imgYUV(:,:,1) = fused;
out = yuv2rgb(imgYUV);
end