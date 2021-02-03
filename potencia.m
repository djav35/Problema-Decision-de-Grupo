function [lambda,x,iter] = potencia(A,tol,nmax,x0)
% Calcula el mayor (abs) autovalor lambda de A y un autovector asociado x

n=size(A,1);

if nargin == 1
    tol = 1e-06; % Tolerancia
    x0=rand(n,1); % Vector de arranque
    nmax=100; % Nº máx iteraciones
end

x0=x0/norm(x0); x1=A*x0;
lambda=x0'*x1;
err = tol*abs(lambda) + 1;
iter=0;

while err > tol*abs(lambda) && abs(lambda) ~= 0 && iter <= nmax
    x=x1; x=x/norm(x);
    x1=A*x; lambda_new=x'*x1;
    err = abs(lambda_new - lambda);
    lambda=lambda_new;
    iter = iter + 1;
end

x = x / sum(x);

end
