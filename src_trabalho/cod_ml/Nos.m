classdef Nos < handle 
    properties
        nome_no
        vizinhanca
    end
    
    properties (Constant = true)
        KNN = 8; % Vizinhos cercanos
    end
    
    methods
        function no = Nos(matriz_imagem)
            no = matriz_imagem;
        end
    end    
end

