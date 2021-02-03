function [w, n, p] = minSumDesvLog(E, n)

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
    beqAux = zeros(longM, 1);

    k=1;
    for i = 1:s(1)
        for j = 1:s(2)
            if (i ~= j)
                notZero = (log(M(i,j)) ~= -Inf);
                % Generar Aeq
                AeqAux(k,i) = notZero;
                AeqAux(k,j) = -1*notZero ;
                % Generar beq
                if (notZero)
                    beqAux(k) = log(M(i,j));
                else 
                    beqAux(k) = 0;
                end
                k = k + 1;
            end
        end
    end
    
    
    Aeq = [Aeq; AeqAux];
    beq = [beq; beqAux];
end

long = size(Aeq, 1);

%Añadimos las metas a las ecuaciones
N = eye(long);
P = -1 * eye(long);

Aeq = [Aeq N P];

x = zeros(s(1) + long + long, 1);
f = [zeros(s(1),1); ones(long,1); ones(long,1)];

% Todos los elementos de x mayor o igual que 0
lb = zeros(length(x), 1);

ub = [];

x = linprog(f, A, b, Aeq, beq, lb, ub);

% Coger de x la parte que nos interesa
v = x(1:s(1));
% Deshacer el cambio logaritmico
w = exp(v);
% Normalizar
w = w/sum(w);

n = x(s(1)+1:s(1)+long);
p = x(s(1)+long+1:s(1)+2*long);
end