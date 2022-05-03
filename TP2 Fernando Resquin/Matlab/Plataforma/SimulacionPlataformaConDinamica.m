clear
clc
%Parámetros dinámicos del robot - [M]= N.m - [I] = N.m2
Ic = (2.13 + 1.7)*9.8;
Ir = 0.5354*9.8;
Mc = (53 + 10)*9.8;
Mr = 8.212*9.8;
% Constantes
r=0.12;
b= 0.2;

%Modelo dinámico inverso
T11 = (1/4)* Mc*r^2 + (Ic*r^2)/(4*b^2 ) + (Mr*r^2)/2 + Ir/2;
T12 = (1/4)*Mc*r^2 - (Ic*r^2)/(4*b^2 );
T21 = (1/4)*Mc*r^2 - (Ic*r^2)/(4*b^2 );
T22 = (1/4)*Mc*r^2 + (Ic*r^2)/(4*b^2 ) + (Mr*r^2)/2 + Ir/2;
T = [T11 T12 ; T21 T22];%;

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
Trayect.v = Trayect.v;


%Inicializo variables generales
dq=0;
dt=1;
cnt=0;
time=0;
Ti_MAX = 0;
Td_MAX = 0;
Pi_MAX = 0;
Pd_MAX = 0;
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
    %Obtengo las velocidades de giro de las ruedas según la Consigna y
    %las aceleraciones de las mismas
    M = P_Cin_Inv(Vx1, Vy1, W1, q1, r, b);    
    d_Wi1=M(1,1) - Wi1; 
    d_Wd1=M(2,1) - Wd1;
    Ai1 = d_Wi1 / dt;
    Ad1 = d_Wd1 / dt;
    Wi1=M(1,1); 
    Wd1=M(2,1);
    %Calculo el torque de cada motor usando el modelo dinamico inverso
    Acc = [Ai1 ; Ad1];
    Torques = T*Acc;
    %Busco los valores de torque máximo
    if(abs(Torques(1,1)) >  abs(Ti_MAX))
        Ti_MAX = Torques(1,1);
    end
    if(abs(Torques(2,1)) >  abs(Td_MAX))
        Td_MAX = Torques(2,1);
    end
    % Claculo la potencia instantánea y la máxima
    Pi = Wi1*Torques(1,1); 
    Pd = Wd1*Torques(2,1); 
    if(abs(Pi) >  abs(Pi_MAX))
        Pi_MAX = Pi;
    end
    if(abs(Pd) >  abs(Pd_MAX))
        Pd_MAX = Pd;
    end
    
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
    Plot_time(cnt)=time;%En el algoritmo en C no vá
    Plot_Wi1(cnt)=Wi1;%En el algoritmo en C no vá
    Plot_Wd1(cnt)=Wd1;%En el algoritmo en C no vá
    Plot_Ti(cnt) = Torques(1,1);%En el algoritmo en C no vá
    Plot_Td(cnt) = Torques(2,1);%En el algoritmo en C no vá
    Plot_Pi(cnt) = Pi;%En el algoritmo en C no vá
    Plot_Pd(cnt) = Pd;%En el algoritmo en C no vá
end
%Imprime los torques y las potencias máximas
str = sprintf('Rueda derecha - Torque Máximo: %f Nm y Potencia Máxima: %f W', Ti_MAX, Pi_MAX);
disp(str);
str = sprintf('Rueda izquierda - Torque Máximo: %f Nm y Potencia Máxima: %f W', Td_MAX, Pd_MAX);
disp(str);
%Grafico la trayectoria y todas las variables que se calculan a partir de la
%Consigna, en función del tiempo
figure(1);
subplot(4,1,1);
plot(Plot_time,Plot_Wi1*60/(2*pi),'Color','b');
axis([50 200 -50 450]);
xlabel('Tiempo [seg]');
ylabel('[RPM]');
hold on;
plot(Plot_time,Plot_Wd1*60/(2*pi),'Color','r');
hold off;
subplot(4,1,2);
plot(Plot_time,(Plot_Wi1-Plot_Wd1)*60/(2*pi),'Color','g');
axis([50 200 -20 20]);
xlabel('Tiempo [seg]');
ylabel('DWr [RPM]');
subplot(4,1,3);
plot(Plot_time,Plot_Ti,'Color','b');
axis([50 200 -600 600]);
xlabel('Tiempo [seg]');
ylabel('Torque [Nm]');
hold on;
plot(Plot_time,Plot_Td,'Color','r');
hold off;
subplot(4,1,4);
plot(Plot_time,Plot_Pi,'Color','b');
axis([50 200 -13000 13000]);
xlabel('Tiempo [seg]');
ylabel('Potencia [W]');
hold on;
plot(Plot_time,Plot_Pd,'Color','r');
hold off;
pause
close all;%Cierro todas las imágenes previas
figure(1);
plot(Plot_time,Plot_Wi1*60/(2*pi),'Color','b');
hold on;
axis([50 200 -600 600]);
xlabel('Tiempo [seg]');
plot(Plot_time,Plot_Wd1*60/(2*pi),'Color','r');
plot(Plot_time,Plot_Ti,'Color','c');
plot(Plot_time,Plot_Td,'Color','m');
hold off;
figure(2);
plot(Plot_time,Plot_Pi,'Color','b');
hold on;
axis([50 200 -13000 13000]);
ylabel('Potencia [W]');
xlabel('Tiempo [seg]')
plot(Plot_time,Plot_Pd,'Color','r');
hold off;




