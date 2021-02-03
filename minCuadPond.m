function w = minCuadPond(E, n)

H = [];
b = [];

for i = 1:n
    M = E{i};

    s = size(M);
    long = (s(1)*s(2))-s(1);

    HAux = zeros([long,s(2)]);

    % Generar b
    bAux=zeros([long,1]);
    %bAux(long+1) = 1;
    b = [b; bAux];

    k = 1;
    for i = 1:s(1)
        for j = 1:s(2)
            if (i ~= j)
                % Generar 
                %(M(i,j) == 0) devuelve 1 o 0 si queremos descartar
                %información que el experto no ha dado
                HAux(k,i) = (M(i,j) ~= 0);
                HAux(k,j) = -M(i,j);
                k=k+1;
            end
        end
    end
    
    H = [H; HAux];
end

H = [H;  ones(1, s(1))];
b = [b; 1];
cond(H'*H)
% Resolver con minimos cuadrados
w=H\b;

% Normalizar
w=w/sum(w);

return
