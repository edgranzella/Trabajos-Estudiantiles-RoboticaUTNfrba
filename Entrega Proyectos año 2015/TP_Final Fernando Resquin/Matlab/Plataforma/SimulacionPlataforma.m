clear
clc

%Inicializo la estructura vectorial
Trayect.x=0;
Trayect.y=0;
Trayect.v=0.001;
Trayect.ind=1;
Trayect = Trayectoria1(Trayect);

%Grafico la trayectoria y todas las variables que se calculan a partir de la
%Consigna, en funci?n del tiempo
figure(1);
plot(Trayect.x,Trayect.y,'Color','b');
title('Trayectoria a seguir');
axis square
xlabel('Eje X [m]');
ylabel('Eje Y [m]');
hold on
plot(0,0,'Color','g','Marker', '>');
plot(40,-35,'Color','r','Marker', '>');
hold off

figure(2);
plot3(Trayect.x,Trayect.y,Trayect.v,'Color','b');
title('Trayectoria a seguir y perfil de velocidad');
axis vis3d;
grid on;
xlabel('Eje X [m]');
ylabel('Eje Y [m]');
zlabel('Velocidad lineal [m/s]');
hold on
plot(0,0,'Color','g','Marker', '>');
plot(40,-35,'Color','r','Marker', '>');
hold off
