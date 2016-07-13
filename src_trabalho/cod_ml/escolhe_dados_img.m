function [etiqueta, img_ordenada_por_digito_sel] = escolhe_dados_img(num_amostras)
    % Carregando as imagens e as etiquetas
    imagens = loadMNISTImages('train-images.idx3-ubyte');
    etiquetas = loadMNISTLabels('train-labels.idx1-ubyte');
    img_ordenada_por_digito = sortrows([etiquetas, imagens'],1)';
    
    % Imagens por numero de amostra
    [qnt_amostras, ~] = hist(etiquetas,unique(etiquetas));
    pos_selec = zeros(1, num_amostras);
    NUMERO_CLASSES = 10;
    num_clas = num_amostras / NUMERO_CLASSES;
    inicio_intervalo = 0; e = 1; % elemento para encontrar a posição
    for i = 1:NUMERO_CLASSES
       pos_selec(e : e + num_clas - 1) = randperm(qnt_amostras(i),num_clas) + inicio_intervalo;
       inicio_intervalo = inicio_intervalo + qnt_amostras(i);
       e = e + num_clas;
    end
    
    % Imagem ordendada sem etiquetas
    img_ordenada_por_digito_sel = img_ordenada_por_digito(2:end, pos_selec);
    etiqueta = img_ordenada_por_digito(1, pos_selec);
end