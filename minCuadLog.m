function w = minCuadLog(E, n)

H = [];
b = [];


for i = 1:n
    M = E{i};

    s=size(M);
    long = (s(1)*s(2))-s(1);

    HAux = zeros([long,s(2)]);
    bAux = zeros([long,1]);

    k = 1;
    for i = 1:s(1)
        for j = 1:s(2)
            if (i ~= j)
                notZero = (log(M(i,j)) ~= -Inf);
                % Generar H
                HAux(k,i) = notZero;
                HAux(k,j) = -1*notZero ;
                % Generar b
                if (notZero)
                    bAux(k) = log(M(i,j));
                else 
                    bAux(k) = 0;
                end
                k = k+1;
            end
        end
    end
    H = [H; HAux];
    b = [b; bAux];
end
cond(H'*H)
% The result h is 1 if the test rejects the null hypothesis at the 5% significance level, 
% that the data in vector x is from a population with a normal distribution, 
% using the Anderson-Darling test, or 0 otherwise.
[h,p,adstat,cv] = adtest(exp(b))
% Resolver con minimos cuadrados
v=H\b;
% Deshacer el cambio de logaritmo.
w=exp(v);
% Normalizar
w=w/sum(w);
return

