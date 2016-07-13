function imagem = ler_imagem(caminho)
    VALOR_IMAMGEM_MAX = 255;
    imagem = double(imread(caminho)) / VALOR_IMAMGEM_MAX; % Normalizando a imagem
    imagem = imagem(:,:,1); % As três camadas da imagem são iguais
end

