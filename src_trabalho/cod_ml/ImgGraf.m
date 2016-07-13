classdef ImgGraf < handle   
    properties        
        valorFrobenius
        matriz
        etiqueta
    end
    
    methods
        % matriz: ja deve de estar normalizada
        function im = ImgGraf(matriz, etiqueta)
            im.matriz = matriz;
            im.etiqueta = etiqueta;
            im.valorFrobenius = im.frobenius;
        end
        
        function mostraImagem(im)
            imshow(im.matriz);
        end
    end
    
    methods (Hidden = true, Access = private)      
        function saida = frobenius(im)
            saida = norm(im.matriz, 'fro');
        end
    end
end

