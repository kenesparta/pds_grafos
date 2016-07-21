classdef Grafo < handle
    properties
        nos
        tamanho
        matrizAdjacencia
        coordenadas
    end
    
    methods
        function gr = Grafo(nos)
            gr.nos = nos;
            gr.tamanho = length(nos);
            gr.matrizAdjacencia = triu(gr.calulo_matriz_adjacencia,1);
            gr.coordenadas = gr.calcular_coordenadas;
        end
        
        function mostra_grafo(gr)
            gplot(gr.matrizAdjacencia, gr.coordenadas, '-*')
        end
    end
    
    methods (Hidden = true, Access = private)
        function matrizAdjacencia = calulo_matriz_adjacencia(gr)
            matrizAdjacencia = zeros(gr.tamanho);
            for i=1:gr.tamanho
               matrizAdjacencia(i,[gr.nos{i}.vizinhanca]) = 1;
            end
        end
        
        function coordenadas = calcular_coordenadas(gr)
            coordenadas = zeros(gr.tamanho, 2);
            for i=1:gr.tamanho
                coordenadas(i,1:end) = gr.nos{i}.coordenadas;
            end
        end
    end
end