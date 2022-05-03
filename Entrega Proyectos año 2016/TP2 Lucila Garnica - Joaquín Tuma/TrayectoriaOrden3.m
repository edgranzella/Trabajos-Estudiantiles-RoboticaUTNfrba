%MASA DEL ROBOT (kg)
m=0.737
%MOMENTO DE INERCIA DEL CONJUNTO MOTOR RUEDA (kg*mm²)
Io=118.02
%MOMENTO DE INERCIA DEL ROBOT CON RESPECTO AL PUNTO A (kg*mm²)
IA=1711.12
%RADIO DE LAS RUEDAS (mm)
r=30
%DISTANCIA ENTRE RUEDAS (mm)
b=135
%DISTANCIA DEL CENTRO DE MASA(mm)
d=30
%COEFICIENTE DE ROZAMIENTO (Nms/rad)
beta= 35*1e-7      

Radio=0.2025 %(m)
L=0.135 %(m)
RgiroR=Radio+(L/2)  % RUEDA DERECHA
RgiroL=Radio-(L/2)  % RUEDA IZQUIERDA

D11=(m*r*r/4)+((IA+m*d*d)*r*r)/(b*b)+Io
D12=(m*r*r/4)-((IA+m*d*d)*r*r)/(b*b)
D22=D11
D21=D12
%MATRIZ DE INERCIA
D=[D11 D12;D21 D22]

thetadr=[0 0]  %theta derivada VELOCIDAD ANGULAR DE LA RUEDA DERECHA rad/s
thetadl=[0 0]  %theta derivada VELOCIDAD ANGULAR DE LA RUEDA IZQUIERDA rad/s
thetaddr=[0 0]    %ACELERACION ANGULAR de la rueda derecha rad/s2
thetaddl=[0 0]    %ACELERACION ANGULAR de la rueda derecha rad/s2

 % Ecuación dinámica
Tr=D11*thetaddr+D12*thetaddl+beta*thetadr
Tl=D21*thetaddr+D22*thetaddl+beta*thetadl  

%Torque Maximo: 20 kg*mm
%POSICION 
% P(t)=a0+a1*t+a2*t^2+a3*t^3

a0=0
a1=0
a2=(3*2*pi*RgiroR)/(10^2 )
a3= -(2*2*pi*RgiroR)/(10^3 )
b0=0
b1=0
b2=(3*2*pi*RgiroL)/(10^2 )
b3= -(2*2*pi*RgiroL)/(10^3 )

X=[0 0]
Y=[0 0]
Pder=[0 0]
Pizq=[0 0]
T=[0 0]
VelR=[0 0]
VelL=[0 0]

AcelR=[0 0]
AcelL=[0 0]
TorqueR=[0 0]
TorqueL=[0 0]
i=1

for t=0:0.5:10
            Pder(1,i)=(a1*t+a2*(t^2)+a3*(t^3))
            Pizq(1,i)=(b1*t+b2*(t^2)+b3*(t^3))          
            T(1,i)=t 
            VelR(1,i)=a1+2*a2*t+3*a3*(t^2)
            VelL(1,i)=b1+2*b2*t+3*b3*(t^2)   % (m/s)
          
            AcelR(1,i)=2*a2+6*a3*t   %  (m/s2)
            AcelL(1,i)=2*b2+6*b3*t
            thetadr(1,i)=VelR(1,i)/(2*pi) %  (rad/s)
            thetadl(1,i)=VelL(1,i)/(2*pi)
            thetaddr(1,i)=AcelR(1,i)/(2*pi)  %  (rad/s2)      dw/dt
            thetaddl(1,i)=AcelL(1,i)/(2*pi)
            TorqueR(1,i)=D11*thetaddr(1,i)+D12*thetaddl(1,i)+beta*thetadr(1,i)
            TorqueL(1,i)=D21*thetaddr(1,i)+D22*thetaddl(1,i)+beta*thetadl(1,i)
            i=i+1   
end 
i=1

 for t=0:0.2:11         
            X(1,i)=Radio*sin((0.0785398)*t/L) 
            Y(1,i)=Radio*cos((0.0785398)*t/L)+Radio            
            i=i+1              
end 
figure(1)
hold on;

subplot(4,2,1);
plot(T,TorqueR,'Color','m');grid on;
title('Rueda Derecha')
ylabel('Torque[N*mm]');
xlabel('Tiempo[s]');
subplot(4,2,3);
plot(T,Pder,'Color','g');grid on;
ylabel('Posicion[m]')
xlabel('Tiempo[s]');
subplot(4,2,5);
plot(T,VelR,'Color','c');grid on;
ylabel('Velocidad[m/s]')
xlabel('Tiempo[s]');
subplot(4,2,7);
plot(T,AcelR,'Color','r');grid on;
ylabel('Aceleración[m/s2]')
xlabel('Tiempo[s]');

subplot(4,2,2);
plot(T,TorqueL,'Color','m');grid on;
title('Rueda Izquierda')
ylabel('Torque [N*mm]');
xlabel('Tiempo[s]');
subplot(4,2,4);
plot(T,Pizq,'Color','g');grid on;
ylabel('Posicion [m]')
xlabel('Tiempo[s]');
subplot(4,2,6);
plot(T,VelL,'Color','g');grid on;
ylabel('Velocidad [m/s]')
xlabel('Tiempo[s]');
subplot(4,2,8);
plot(T,AcelL,'Color','r');grid on;
ylabel('Aceleración [m/s2]')
xlabel('Tiempo[s]');

figure(2)
hold on;

subplot(2,2,1);
plot(T,thetadr,'Color','c');grid on;
title('Rueda Derecha')
ylabel('Velocidad Angular [rad/s]');
xlabel('Tiempo[s]');
subplot(2,2,3);
plot(T,thetaddr,'Color','r');grid on;
ylabel('Aceleracion Angular [rad/s2]]')
xlabel('Tiempo[s]');
subplot(2,2,2);
plot(T,thetadl,'Color','c');grid on;
title('Rueda Izquierda')
ylabel('Velocidad Angular [rad/s]');
xlabel('Tiempo[s]');
subplot(2,2,4);
plot(T,thetaddl,'Color','r');grid on;
ylabel('Aceleracion Angular[rad/s2]]')
xlabel('Tiempo[s]');

figure(3)
hold on;
plot(X,Y,'Color','m');grid on;
title('Trayectoria del Robot')
ylabel('Posicion Y[m]');
xlabel('Posicion X[m]');