function grafo = kdd(etiqueta, matriz_com_imagens)
    NUMERO_VIZINHOS = 8;  PIXEL = 28;
    [~, num_elem] = size(matriz_com_imagens);
    conjunto_nos = cell(1, num_elem);
    for i=1:num_elem
        % Rearranjando as matrizes
        matriz_re = reshape(matriz_com_imagens(1:end, i), PIXEL, PIXEL);
        conjunto_nos{i} = Nos(matriz_re, etiqueta(i), i);
    end
    
    % Maztriz de valores de Frobenius    
    vetor_frobenius = zeros(1,num_elem-1);
    chaves = zeros(1,num_elem-1);
    matriz_elementos = 1:num_elem;
    for i=1:num_elem
        e = matriz_elementos(matriz_elementos~=i);
        for j=1:num_elem-1
            diferencia = conjunto_nos{i}.imagemAsociada.matriz - ...
                         conjunto_nos{e(j)}.imagemAsociada.matriz;
            vetor_frobenius(j) = norm(diferencia, 'fro');
            chaves(j) = conjunto_nos{e(j)}.pos_rel;
        end
        tabela_frobenius = sortrows([chaves;vetor_frobenius]', 2);
        conjunto_nos{i}.vizinhanca = tabela_frobenius(1:NUMERO_VIZINHOS,1);
    end
    grafo = Grafo(conjunto_nos);
end