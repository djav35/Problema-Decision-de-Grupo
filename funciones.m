function w = funciones(metodo, varargin)

 % Juntar las matrices de los expertos
    M = varargin{1};
    for i = 2 : nargin-1 
        M = [M; varargin{i}];
    end

if nargin == 1
    [~, w, ~] = potencia(M);
else
    if metodo == 0 && nargin == 2
        [~, w, ~] = potencia(M);
    elseif metodo == 0 && nargin >= 2
        fprintf("Número erróneo de argumentos\n");
    elseif metodo == 1
        w = minCuadLog(varargin, nargin-1);
    elseif metodo == 2
        w = minCuadPond(varargin, nargin-1);
    elseif metodo == 3
        [w, ~, ~] = minSumDesvLog(varargin, nargin-1);
    else
        [w, ~, ~] = minSumDesvPond(varargin, nargin-1);
    end
end

return

