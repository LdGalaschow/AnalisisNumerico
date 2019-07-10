%Ecuaciones de Lotka-Volterra, Metodo de Un Paso, Euler
clear all
N=1000; %N�mero de iteraciones del Sistema.
a=0.4;b=0.37;c=0.3;d=0.05;  %Valor de las constantes del modelo.
t0=0; tN=100; h=(tN-t0)/N;  %Tiempo inicial, final y espacio entre iteraciones.
C(1)=3; Z(1)=1;  %Condiciones iniciales
 
for i = 1:N
%C�lculo del pr�ximo valor de C, Z por el m�todo de Euler.
C(i+1) = C(i) + h*C(i)*(a-c*Z(i));
Z(i+1) = Z(i) + h*Z(i)*(-b+d*C(i));
end;
T=t0:h:tN;
 
%Grafica.
hold on
figure(1)
plot(T,C,'r')
plot(T,Z,'g')
xlabel('Tiempo')
ylabel('Poblacion')
legend('Conejos','Zorros') 
figure(2)
plot(C,Z)
xlabel('Poblacion de Conejos')
ylabel('Poblacion de Zorros')
hold off