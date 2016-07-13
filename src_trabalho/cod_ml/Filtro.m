classdef Filtro    
    properties
        grau
        coeficientes        
        matriz_adjacencia
        matriz_filtro
        tam % Tamanho da matriz de adjacencia
    end
    
    methods
        function filtro = Filtro(matriz_adjacencia, grau)
            filtro.matriz_adjacencia = matriz_adjacencia;
            filtro.tam = length(matriz_adjacencia);
            filtro.grau = grau;
            filtro.coeficientes = -rand(1,grau);
            filtro.matriz_filtro = filtro.saida_filtro;
        end
    end
    
    methods (Hidden = true, Access = private)
        function saida = saida_filtro(filtro)
            saida = zeros(filtro.tam);
            for i=1:filtro.grau
                saida = saida + filtro.coeficientes(i) * filtro.matriz_adjacencia ^ (i-1);
            end
        end
    end
    
end

