clear all
N=10000; %Número de iteraciones del sistema.
a=0.4;b=0.37;c=0.3;d=0.05; %Valor de las constantes del modelo.
t0=0; tN=100; h=(tN-t0)/N; %Tiempo inicial, final y espacio entre iteraciones.
C(1)=3; Z(1)=1; %Condiciones iniciales.
 
for i = 1:N       
%Cálculo de las Ctes k1-k4.    
k1=[a*C(i)-c*Z(i)*C(i), -b*Z(i)+d*Z(i)*C(i)];    
k2=[a*(C(i)+h*k1(1)/2)-c*(Z(i)+h*k1(2)/2)*(C(i)+h*k1(1)/2), -b*(Z(i)+h*k1(2)/2)+d*(Z(i)+h*k1(2)/2)*(C(i)+h*k1(1)/2)];    
k3=[a*(C(i)+h*k2(1)/2)-c*(Z(i)+h*k2(2)/2)*(C(i)+h*k2(1)/2), -b*(Z(i)+h*k2(2)/2)+d*(Z(i)+h*k2(2)/2)*(C(i)+h*k2(1)/2)];    
k4=[a*(C(i)+h*k3(1))-c*(Z(i)+h*k3(2))*(C(i)+h*k3(1)), -b*(Z(i)+h*k3(2))+d*(Z(i)+h*k3(2))*(C(i)+h*k3(1))];    
%Cálculo del próximo valor de C, Z.    
C(i+1)=C(i)+h*(k1(1)+2*k2(1)+2*k3(1)+k4(1))/6;    
Z(i+1)=Z(i)+h*(k1(2)+2*k2(2)+2*k3(2)+k4(2))/6;
end;
T=t0:h:tN; 
 
%Gráfica de la solución.
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