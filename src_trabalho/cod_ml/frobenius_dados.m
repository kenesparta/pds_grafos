clear
clc
CONJUNTO = 10000;
w = kdd(escolhe_dados_img(CONJUNTO));
dadosFrob = zeros(1,CONJUNTO);
for i=1:CONJUNTO
    dadosFrob(i) = w{i}.imagemAsociada.valorFrobenius;
end
CLASSES = 1:CONJUNTO/10:CONJUNTO;
stem(CLASSES, max(dadosFrob)*ones(1,length(CLASSES))); hold on;
plot(dadosFrob)