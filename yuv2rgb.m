function rgb  = yuv2rgb(image)
image = double(image);
Y = image(:,:,1);
U = image(:,:,2);
V = image(:,:,3);
 
R = Y + 1.402.*(V-128);
 
G = Y - 0.34414.*(U-128) - 0.71414.*(V-128);
 
B = Y + 1.772.*(U-128);
 
rgb(:,:,1) = R;
rgb(:,:,2) = G;
rgb(:,:,3) = B;
end