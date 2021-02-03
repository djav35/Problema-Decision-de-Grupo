function [w, n, p] = minSumDesvPond(E, n)

Aeq = [];
beq = [];

s = zeros(1, 2);

for i = 1:n
    M = E{i};
    
    s = size(M);
    longM = (s(1)*s(2))-s(1);

    % No hay desigualdades
    A = [];
    b = [];

    AeqAux = zeros(longM, s(2));

    k = 1;
    for i = 1:s(1)
        for j = 1:s(2)
            if (i ~= j)
                % Generar Aeq
                AeqAux(k,i) = (M(i,j) ~= 0);
                AeqAux(k,j) = -M(i,j);
                k = k + 1;
            end
        end
    end
    
    Aeq = [Aeq; AeqAux];
end

long = size(Aeq, 1);

%Añadimos las metas a las ecuaciones
N = eye(long);
P = -1 * eye(long);
Aeq = [[Aeq N P]; [ones(1, s(1)) zeros(1, 2*long)]];

x = zeros(s(1) + long + long, 1);
f = [zeros(s(1),1); ones(long,1); ones(long,1)];
    
beq = zeros([long+1,1]);
beq(long+1) = 1;

% Todos los elementos de x mayor o igual que 0
lb = zeros(length(x), 1);

ub = [];

x = linprog(f, A, b, Aeq, beq, lb, ub);

% Coger de x la parte que nos interesa
w = x(1:s(1));

% Normalizar
w = w/sum(w);

n = x(s(1)+1:s(1)+long);
p = x(s(1)+long+1:s(1)+2*long);
end