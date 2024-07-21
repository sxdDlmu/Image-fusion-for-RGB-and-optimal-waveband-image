function yuv = rgb2yuv(image)
image = double(image);
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);
 
yuv(:,:,1) = 0.299.*R + 0.587.*G + 0.114.*B;
yuv(:,:,2) = - 0.1687.*R - 0.3313.*G + 0.5.*B + 128;
yuv(:,:,3) = 0.5.*R - 0.4187.*G - 0.0813.*B + 128;
end

