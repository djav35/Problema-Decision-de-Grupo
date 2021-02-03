clc;
clear;
    
fprintf("-------------Consistente-------------\n");
w = [0.4 0.3 0.2 0.1]
M= zeros(4);
for i = 1:4
    for j = 1:4
        M(i,j) = w(i)/w(j);
    end
end

M
ic(M)

fprintf("-------------Metodo de la potencia-------------\n");
w0 = funciones(0, M) % potencia(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w0, M)

fprintf("-------------Metodo de Minimos Cuadrados [Log]-------------\n");
w1 = funciones(1, M) % minCuadLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w1, M)

fprintf("-------------Metodo de Minimos Cuadrados [Ponderado]-------------\n");
w2 = funciones(2, M) % minCuadPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w2, M)

fprintf("-------------Metodo de Minimo Suma Desviaciones [Log]-------------\n");
w3 = funciones(3, M) % minSumDesvLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w3, M)

fprintf("-------------Metodo de Minimo Suma Desviaciones [Ponderado]-------------\n");
w4 = funciones(4, M) % minSumDesvPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w4, M)

%Dibujar pesos
figure();
c = categorical(["Potencia", "Min Cuadrado Log", "Min Cuadrado Pond", "Min Sum Desv Log", "Min Sum Desv Pond"]); 
bar(c, [w0';w1';w2';w3';w4']);
l=compose("A%d",(1:length(M)));
legend(l);

clear;

fprintf("-------------Consistente Varios Expertos-------------\n");
w = [0.4 0.3 0.2 0.1]
M= zeros(4);
for i = 1:4
    for j = 1:4
        M(i,j) = w(i)/w(j);
    end
end

M
ic(M)

fprintf("-------------Metodo de Minimos Cuadrados [Log]-------------\n");
w1 = funciones(1, M, M) % minCuadLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w1, M, M)

fprintf("-------------Metodo de Minimos Cuadrados [Ponderado]-------------\n");
w2 = funciones(2, M, M) % minCuadPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w2, M, M)

fprintf("-------------Metodo de Minimo Suma Desviaciones [Log]-------------\n");
w3 = funciones(3, M, M) % minSumDesvLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w3, M, M)

fprintf("-------------Metodo de Minimo Suma Desviaciones [Ponderado]-------------\n");
w4 = funciones(4, M, M) % minSumDesvPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w4, M, M)

%Dibujar pesos
figure();
c = categorical(["Min Cuadrado Log", "Min Cuadrado Pond", "Min Sum Desv Log", "Min Sum Desv Pond"]); 
bar(c, [w1';w2';w3';w4']);
l=compose("A%d",(1:length(M)));
legend(l);

clear;



fprintf("-------------Consistente Incompleta-------------\n");
w = [0.4 0.3 0.2 0.1]
M= zeros(4);
for i = 1:4
    for j = 1:4
        M(i,j) = w(i)/w(j);
    end
end

%El experto no opina sobre la opcion 1
M(1,[3 4]) = 0;
M([3 4],1) = 0;

M
ic(M)

%M =
%
%         1     1.333         0         0
%      0.75    1.0000    1.5000    3.0000
%         0    0.6667    1.0000    2.0000
%         0    0.3333    0.5000    1.0000


fprintf("-------------Metodo de la potencia-------------\n");
w0 = funciones(0, M) % potencia(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w0, M)

fprintf("-------------Metodo de Minimos Cuadrados [Log]-------------\n");
w1 = funciones(1, M) % minCuadLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w1, M)

fprintf("-------------Metodo de Minimos Cuadrados [Ponderado]-------------\n");
w2 = funciones(2, M) % minCuadPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w2, M)

fprintf("-------------Metodo de Minimo Suma Desviaciones [Log]-------------\n");
w3 = funciones(3, M) % minSumDesvLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w3, M)

fprintf("-------------Metodo de Minimo Suma Desviaciones [Ponderado]-------------\n");
w4 = funciones(4, M) % minSumDesvPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w4, M)

%Dibujar pesos
figure();
c = categorical(["Min Cuadrado Log", "Min Cuadrado Pond", "Min Sum Desv Log", "Min Sum Desv Pond"]); 
bar(c, [w1';w2';w3';w4']);
l=compose("A%d",(1:length(M)));
legend(l);

clear;


fprintf("-------------NO Consistente-------------\n");
M = [1.0000   0.1429    0.1429    0.2000;
    7.0000    1.0000    0.5000    0.3333;
    7.0000    2.0000    1.0000    0.1111;
    5.0000    3.0000    9.0000    1.0000]

%M2 = [1 2,2,4;1,1,1.5,3;0.5,0.6,1,2;0.25,0.3,0.5,1]

ic(M)

fprintf("-------------Metodo de la potencia-------------\n");
w0 = funciones(0, M) % potencia(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w0, M)

fprintf("-------------Metodo de Minimos Cuadrados [Log]-------------\n");
w1 = funciones(1, M) % minCuadLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w1, M)
fprintf("-------------Metodo de Minimos Cuadrados [Ponderado]-------------\n");
w2 = funciones(2, M) % minCuadPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w2, M)

fprintf("-------------Metodo de Minimo Suma Desviaciones [Log]-------------\n");
w3 = funciones(3, M) % minSumDesvLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w3, M)

fprintf("-------------Metodo de Minimo Suma Desviaciones [Ponderado]-------------\n");
w4 = funciones(4, M) % minSumDesvPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w4, M)

%Dibujar pesos
figure();
c = categorical(["Potencia", "Min Cuadrado Log", "Min Cuadrado Pond", "Min Sum Desv Log", "Min Sum Desv Pond"]); 
bar(c, [w0';w1';w2';w3';w4']);
l=compose("A%d",(1:length(M)));
legend(l);


fprintf("-------------NO Consistente Incompleta Varios Expertos-------------\n");
M1 = [1    0    1/7    1/5;
    0    1    1/2    1/3;
    7    2   1    1/9;
    5   3    9   1]

M2 = [1  0  1/3 1/9;
      0  1   0  1/8;
      3  0   1  1/9;
      9   8  9   1]
  
M3 = [1 1/3 0 0;
      3  1  1/2 1/5;
      0  2   1  0;
      0  5   0    1]

%M1 = [1 3 0 1/2;
%    1/3 1 2 1/5;
%    0 1/2 1 1/9;
%    2 5 9 1]

%M2 = [1 1/2 3 4;
%    2 1 0 9;
%    1/3 0 1 2;
%    1/4 1/9 1/2 1]

%Tomamos M3 traspuesta
ic(M1)
ic(M2)
ic(M3')

fprintf("-------------Metodo de Minimos Cuadrados [Log]-------------\n");
w1 = funciones(1, M1, M2, M3') % minCuadLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w1, M1, M2, M3')

fprintf("-------------Metodo de Minimos Cuadrados [Ponderado]-------------\n");
w2 = funciones(2, M1, M2, M3') % minCuadPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w2, M1, M2, M3')

fprintf("-------------Metodo de Minimo Suma Desviaciones [Log]-------------\n");
w3 = funciones(3, M1, M2, M3') % minSumDesvLog(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w3, M1, M2, M3')

fprintf("-------------Metodo de Minimo Suma Desviaciones [Ponderado]-------------\n");
w4 = funciones(4, M1, M2, M3') % minSumDesvPond(M)
[errorInf, IndexMaxErr, errorFro, errorUno,  errorNoAciertos] = errores(w4, M1, M2, M3')

%Dibujar pesos
figure();
c = categorical(["Min Cuadrado Log", "Min Cuadrado Pond", "Min Sum Desv Log", "Min Sum Desv Pond"]); 
bar(c, [w1';w2';w3';w4']);
l=compose("A%d",(1:length(M)));
legend(l);

%Dibujar digrafo
grafo(M1, M2, M3')

