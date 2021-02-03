function res = ic(M)
%Autovalor dominante
lambda = max(eig(M));
m = length(M); 
%Calculo del indice de consistencia
res = (lambda - m)/ (m - 1);
return