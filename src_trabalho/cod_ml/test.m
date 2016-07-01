clc
clear

imdata = imread('ex.png');

images = loadMNISTImages('train-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');

% We are using display_network from the autoencoder code
%display_network(images(:,1:100)); % Show the first 100 images
tamanho = size(images(1:end,end));
disp (tamanho)
im = double(255-imdata)/255;
%imshow(im(:,:,1))
i = 255;
im1 = ImgGraf(im(:,:,1));
images_t = reshape(images(1:end,labels(i)),28,28);
imshow(images_t)
im2 = ImgGraf(images_t);
disp(images(1));