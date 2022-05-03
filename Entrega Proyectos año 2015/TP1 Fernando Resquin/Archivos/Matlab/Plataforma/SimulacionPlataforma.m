clear
clc
%Variables para cinemática inversa (Consigna)
R=0;
Wi1=0;
Wd1=0;
Vx1=0;
Vy1=0;
W1=0;
W1p=0;
q1=0;
phi1=0;
qi1=0;
qd1=0;
v1=0;

%Variables para cinemática directa (Actuación)
Wi2=0;
Wd2=0;
Vx2=0;
Vy2=0; 
W2=0;
q2=0;
dt=0;
X2=0;
Y2=0;
v2=0;

%Inicializo la estructura vectorial
Trayect.x=0;
Trayect.y=0;
Trayect.v=0;
Trayect.ind=1;
Trayect = Trayectoria1(Trayect);

% Constantes
r=0.12;
b= 0.2;

%Inicializo variables generales
dq=0;
dt=1;
cnt=0;
time=0;
for cnt=2:1:Trayect.ind
    W1p=dq/dt;%Verdadero valor de W indicado por la consigna
    %Proyecto en x e y la velocidad de movimiento(Setpoint) 
    Vx1=Trayect.v(cnt)*cos(q1);
    Vy1=Trayect.v(cnt)*sin(q1);
    %Determino el vector de orientación actual y el del sgte punto
    Vector1_X=cos(q1);
    Vector1_Y=sin(q1);
    Vector2_X=Trayect.x(cnt) - Trayect.x(cnt-1);
    Vector2_Y=Trayect.y(cnt) - Trayect.y(cnt-1);
    %Detecto puntos consecutivos con los mismos x y
    if(Vector2_X ~=0 || Vector2_Y ~=0)
    %Obtengo las velocidades de giro de las ruedas según la Consigna
    M = P_Cin_Inv(Vx1, Vy1, W1, q1, r, b);    
    Wi1=M(1,1); 
    Wd1=M(2,1);
    %Calculo la distancia entre puntos
    despl= sqrt((Vector2_X)^2 + (Vector2_Y)^2 );
    %Determino el intervalo de tiempo entre puntos
    dt=despl/Trayect.v(cnt);
    time = time + dt;%Actualizo el tiempo 
    %Calculo el radio de rotación del ICC
    R=b*(Wd1 + Wi1)/(Wd1-Wi1);
    %Calculo el incremento de angulo en la orientación
    rotac = vrrotvec([Vector1_X Vector1_Y 0],[Vector2_X Vector2_Y 0]);
    dq=rotac(3)*rotac(4);
    q1 = q1 + dq;%Actualizo la orientación de la plataforma
    %phi es lo mismo que q pero con rango [-pi pi] (Verdadera Orientación)
    phi1 = q1;
    if(phi1 > pi)
    phi1=2*pi-phi1;    
    end
    if(phi1 < -pi)
    phi1 = 2*pi + phi1;    
    end
    %Calculo las coordenadas articulares en radianes (Odometría)
    %En el DSP lo saco del encoder
    qi1=qi1+Wi1*dt;
    qd1=qd1+Wd1*dt;
    
    %Valor auxiliar de W1 que es W1p desplazado en el tiempo
    %Sin esto no funciona!
    W1=dq/dt;
    
    v1=Trayect.v(cnt);%Velocidad de desplazamiento indicado por la Consigna
    
    %Llamo a la cinemática directa y obtengo las variables de actuación Vx,
    %Vy, W.
    M=P_Cin_Dir(Wi1, Wd1, q1 , r, b);
    Vx2=M(1,1); 
    Vy2=M(2,1);
    W2=M(3,1);
    %Velocidad de desplazamiento indicado por la Consigna
    v2=sqrt(Vx2^2 + Vy2^2);
    %Integrando Vx y Vy obtengo los puntos de la trayectoria real
    X2=X2 + Vx2*dt;
    Y2=Y2 + Vy2*dt;    
    else
    display('Dos puntos coincidentes');%Marco el error
    end
    %Vectores temporales para luego plotear
    Plot_dt(cnt)=dt;%En el algoritmo en C no vá
    Plot_W2(cnt)=W2;%En el algoritmo en C no vá
    Plot_X2(cnt)= X2;%En el algoritmo en C no vá
    Plot_Y2(cnt)= Y2;%En el algoritmo en C no vá
    Plot_V2(cnt)= v2;%En el algoritmo en C no vá
    Plot_V1(cnt)= v1;%En el algoritmo en C no vá
    Plot_Wi1(cnt)=Wi1;%En el algoritmo en C no vá
    Plot_Wd1(cnt)=Wd1;%En el algoritmo en C no vá
    Plot_R(cnt)=R;
    Plot_time(cnt)=time;%En el algoritmo en C no vá
    Plot_W1(cnt)=W1;%En el algoritmo en C no vá
    Plot_W1p(cnt)=W1p;%En el algoritmo en C no vá
    Plot_q1(cnt)=q1;%En el algoritmo en C no vá
    Plot_phi(cnt)=phi1;%En el algoritmo en C no vá
    Plot_qi(cnt)=qi1;%En el algoritmo en C no vá
    Plot_qd(cnt)=qd1;%En el algoritmo en C no vá
end
%Grafico la trayectoria y todas las variables que se calculan a partir de la
%Consigna, en función del tiempo
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
plot(Plot_time,Plot_Wi1*60/(2*pi),'Color','b');
hold on;
plot(Plot_time,Plot_Wd1*60/(2*pi),'Color','r');
hold off
title('Wi, Wd');
axis([0 200 -200 600]);
xlabel('Tiempo [seg]');
ylabel('[RPM]');
figure(3);
plot(Plot_time,Plot_R);
title('R');
axis([0 200 -20 20]);
xlabel('Tiempo [seg]');
ylabel('Radio de giro [m]');
figure(4);
plot(Plot_time,Plot_W1*60/(2*pi));
title('W');
axis([0 200 -10 10]);
xlabel('Tiempo [seg]');
ylabel('[RPM]');
figure(5);
plot(Plot_time,Plot_q1*180/pi);
hold on;
plot(Plot_time,Plot_phi*180/pi,'--r');
hold off
title('q, phi');
axis([0 200 -150 500]);
xlabel('Tiempo [seg]');
ylabel('Orientación [°]');
figure(6);
plot(Plot_time,Plot_qi*2*pi*r);
hold on;
plot(Plot_time,Plot_qd*2*pi*r,':r');
hold off
title('Di, Dd');
axis([0 200 -pi 3000]);
xlabel('Tiempo [seg]');
ylabel('Odometría Izquierda y Derecha [m]');
figure(7);
plot(Plot_time,Trayect.v);
title('Velocidad de recorrido');
axis([0 200 0 6]);
xlabel('Tiempo [seg]');
ylabel('Velocidad m/s');
%Luego de presionar la tecla compara las variables del modelo directo con
%las del inverso
pause
close all;%Cierro todas las imágenes previas
figure(1);
plot(Trayect.x,Trayect.y,'Color','b', 'LineWidth', 2);
title('Trayectoria a seguir');
axis square
xlabel('Eje X [m]');
ylabel('Eje Y [m]');
hold on;
plot(Plot_X2,Plot_Y2,':r', 'LineWidth', 2);
plot(0,0,'Color','g','Marker', '>');
plot(40,-35,'Color','r','Marker', '>');
hold off

figure(2);
subplot(3,1,1);
plot(Plot_time,Plot_V1, 'LineWidth', 2);
title('Velocidad de recorrido');
axis([0 200 0 10]);
xlabel('Tiempo [seg]');
ylabel('Velocidad m/s');
hold on;
plot(Plot_time,Plot_V2,'-.r', 'LineWidth', 2);
hold off
line
subplot(3,1,2);
plot(Plot_time,Plot_W1p*60/(2*pi), 'LineWidth', 2);
title('W');
axis([0 200 -10 10]);
xlabel('Tiempo [seg]');
ylabel('[RPM]');
hold on;
plot(Plot_time,Plot_W2*60/(2*pi),'-.r', 'LineWidth', 2);
hold off;