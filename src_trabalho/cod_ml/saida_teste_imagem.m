images = loadMNISTImages('train-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');
etiqueta = 1120; % A posição da imagem
imagem_com_etiqueta = images(1:end,labels(etiqueta)); % vetor de 784 posições

% Colocando as dimensões de 28x28 px
images_t = reshape(imagem_com_etiqueta, 28, 28);
% Mostarndo a imagem número 59999
imshow(images_t,'InitialMagnification','fit')

imshow(reshape(a(1:end,20),28,28))