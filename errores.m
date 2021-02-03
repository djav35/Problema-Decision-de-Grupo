function [errorInf, IndexMaxErr, errorFro, errorUno, errorNoAciertos] = errores(w,varargin)

datos_conocidos_total = 0;
errorInf = [];
IndexMaxErr = [];
errorFro = []; 
errorUno = []; 
errorNoAciertos = [];

M = [];
W = [];

% Construccion W 
WAux = zeros(size(varargin{1}));
for i = 1:size(w)
    for j = 1:size(w)
        WAux(i,j) = w(i)/w(j);
    end
end

% Errores de cada experto
for k = 1:nargin
 
   
    if k == nargin 
        E = M;
        WAux = W;
    else    
        E = varargin{k};
        
        % Contar 0s de M
        datos_conocidos = 0;
        for m = 1:length(E)
            for n = 1:length(E)
                if E(m,n) ~= 0 
                    datos_conocidos = datos_conocidos + 1;
                end
            end
        end
    end
    
    
    WAux2 = WAux .* zerosM(E);
    % Matriz de residuos
    R = abs(E-WAux2) ;

    % Norma Infinito: residuo maximo y su indice
    [errorInfAux, I] = max(R(:));
    errorInf = [errorInf errorInfAux/datos_conocidos];
    [I_row, I_col] = ind2sub(size(R),I);
    IndexMaxErr = [IndexMaxErr [I_row, I_col]];

    % Norma Frobenius
    errorFroAux = norm(R,'fro');
    errorFro = [errorFro errorFroAux/datos_conocidos];

    % Norma 1 
    errorUnoAux = sum(sum(R));
    errorUno = [errorUno errorUnoAux/datos_conocidos];

    % Norma "ErrorRel"
    % errorErrRelAux = norm(R./M, 'fro'); Puede dividir por 0
    % errorErrRel = [errorErrRel errorErrRelAux/datos_conocidos];
  
    % Norma "No aciertos"
    [m, n] = size(E);
    errorNoAciertosAux = 0;
    for i = 1:m
        for j = i:n
            if (E(i,j) > 0)
                if w(i) > w(j) && E(i,j) < 1
                    errorNoAciertosAux = errorNoAciertosAux + 1;
                elseif (w(i) == w(j) && E(i,j) ~= 1) || (w(i) ~= w(j) && E(i,j) == 1)
                    errorNoAciertosAux = errorNoAciertosAux + 0.5;
                end
            end
        end
    end
    errorNoAciertos = [errorNoAciertos errorNoAciertosAux/datos_conocidos];
    
    % Si solo nos pasan una matriz
    if (nargin == 2) 
        break;
    end
        
    M = [M; E];
    W = [W; WAux2];
    datos_conocidos_total = datos_conocidos_total + datos_conocidos;
    
end

if nargin > 2
    figure();
    l=compose("E%d",(1:nargin-1));
    % Pie
    tiledlayout(1, 3);
    ax1 = nexttile;
    pie(ax1, errorInf(1:end-1)./sum(errorInf(1:end-1)))
    legend(l)
    title('Error Inf')

    ax2 = nexttile;
    pie(ax2,errorFro(1:end-1)./sum(errorFro(1:end-1)))
    legend(l)
    title('Error Frobenius')

    ax3 = nexttile;
    pie(ax3,errorUno(1:end-1)./sum(errorUno(1:end-1)))
    legend(l)
    title('Error 1')
end

end