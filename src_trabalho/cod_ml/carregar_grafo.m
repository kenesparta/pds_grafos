function grafo = carregar_grafo(tamanho)
    [E, I] = escolhe_dados_img(tamanho);
    grafo = kdd(E, I);
end

