classdef Nos < handle 
    properties
        imagemAsociada
        vizinhanca
        pos_rel % Posição relativa do nó na matriz
        coordenadas % Coordenadas no espaço para graficar        
    end
    
    methods
        % matriz_imagem: deve ser uma matriz 28x28 e normalizada
        %                com valores menores do que 1.
        function no = Nos(matriz_imagem, etiqueta, pos_rel)
            no.imagemAsociada = ImgGraf(matriz_imagem, etiqueta);
            no.pos_rel = pos_rel;
            no.coordenadas = randi([-30000 30000],1,2);
            %pos_rel * rand(1,2) * 100;
        end
    end
end