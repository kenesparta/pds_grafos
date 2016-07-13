clc
clear

%imdata = imread('ex.png');
%im_norm = double(imdata)/255; % Normalizando a imagem
%im_norm = im_norm(:,:,1); % As tr�s camadas da imagem s�o iguais
%imshow(im_norm,'InitialMagnification','fit')
% 
% images = loadMNISTImages('train-images.idx3-ubyte');
% labels = loadMNISTLabels('train-labels.idx1-ubyte');
% 
% % We are using display_network from the autoencoder code
% %display_network(images(:,1:100)); % Show the first 100 images
% tamanho = size(images(1:end,end));
% disp (tamanho)
% im = double(255-imdata)/255;
% %imshow(im(:,:,1))
% i = 255;
% im1 = Nos(im(:,:,1));
% images_t = reshape(images(1:end,labels(i)),28,28);
% imshow(images_t)
% im2 = ImgGraf(images_t);
% disp(images(1));

% CONJUNTO = 10;
% w = kdd(escolhe_dados_img(CONJUNTO));
% dadosFrob = zeros(1,CONJUNTO);
% for i=1:CONJUNTO
%     dadosFrob(i) = w{i}.imagemAsociada.valorFrobenius;
% end
% CLASSES = 1:CONJUNTO/10:CONJUNTO;
% plot(dadosFrob)

% S_conhecidas: etiquetas conhecidas.

parpool('local', 4);
tic;
tam = 100; percentagem_conhecida = .3; percentagem_treino = .1;
tam_con = tam * percentagem_conhecida;
tam_treino = tam * percentagem_treino;
[E, I] = escolhe_dados_img(tam);
im_treino = cell(1, tam_con);
w = kdd(E, I);
S_conhecidos = zeros(1,tam);
S_treino = zeros(1,tam);
%w.mostra_grafo

valores = zeros(1,tam);
for i=1:tam
    valores(i) = w.nos{i}.imagemAsociada.valorFrobenius;
    %S_conhecidas = 
end

e = 1; p = 1;% Elementos de treino
num_clas = tam/10; tam_classe_con = tam_con/10; tam_class_tre = tam_con/10;
pos_conhecidas = zeros(1,tam_con);
pos_treino = zeros(1,tam_treino);
for i=1:10
    pos_conhecidas(p : p + tam_classe_con - 1) = e : e + tam_classe_con - 1;
    pos_treino(p : p + tam_classe_con - 1) = e + tam_classe_con : e + tam_classe_con + tam_class_tre - 1;
    e = e + num_clas;
    p = p + tam_classe_con;
end

% Etiquetas para os n�s conhecidos
cont_im_treino = 1;
for i=pos_conhecidas
    S_conhecidos(i) = 1;
end

% Etiquetas para os n�s de treino
for i=pos_treino
    S_treino(i) = -1;
end

filtro = Filtro(w.matrizAdjacencia, 15);
condicao = diag(S_conhecidos) * filtro.matriz_filtro * S_treino';
MSR = sqrt(sum((condicao - ones(tam,1)).^2));
% w.mostra_grafo

% plot(valores)
toc;
delete(gcp)
