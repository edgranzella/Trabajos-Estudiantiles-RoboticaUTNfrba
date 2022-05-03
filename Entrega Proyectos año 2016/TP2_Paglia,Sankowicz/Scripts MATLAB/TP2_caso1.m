clear
clc
close all

%masa en kilos
m=0.6 
%radio de las ruedas en metros
r=0.03
%distancia entre ruedas en metros
l=13.5/100;
%distancia a en metros
a=0.065;
%distancia entre centro de a a COG en metros (medir en solidworks)
b=27.36/1000;
%Coeficiente de Rozamiento de las ruedas
beta=35*1e-7;
%Momento de inercia del robot medido con respecto al punto Q
%Medido en kg*mm^2
%para los calculos hay que ponerlo en kg*m^2
Pxq = 1648064.04;
Pxq = Pxq/1e9;
Pyq = 1676449.84;
Pyq = Pyq/1e9;
Pzq = 2560757.06;
Pzq = Pzq/1e9;
Iq=sqrt(Pxq^2+Pyq^2+Pzq^2);

%Momento de inercia de ruedas y motores medido con respecto al punto Q
%Medido en kg*mm^2
%para los calculos hay que ponerlo en kg*m^2
Pxm = 156347.59;
Pym = 1060347.18;
Pzm = 1061776.17;

Pxm = Pxm/1e9;
Pym = Pym/1e9;
Pzm = Pzm/1e9;
Io=sqrt(Pxm^2+Pym^2+Pzm^2);

D11=((m*r^2)/4) + (((Iq+m*b^2)*r^2)/(8*a^2)) + Io;
D22=D11;

D12=((m*r^2)/4) - (((Iq+m*b^2)*r^2)/(8*a^2));
D21=D12;

%Tomo la trayectoria del TP1, para eso traigo el vector de velocidades con
%el de tiempos
%circunferencia en metros
circ=2*pi*r;
%velocidad nominal en rpm
vnomrpm=200;
%velocidad nominal en metros/segundo
vnom=vnomrpm*circ/60;
%-----------Vectores de velocidades y tiempos-------------
%velocidad izquierda en porcentaje de la nominal
porcentaje_vL=[0.1 , 0.4 , 0.6 , 0.4 , 0.7 , 0.8 , 0.5 , 0.7 ,0.7 , 0.9];
%velocidad izquierda en metros/segundo
vL=porcentaje_vL*vnom;

%velocidad derecha en porcentaje de la nominal
porcentaje_vR=[0.2 , 0.1 , 0.2 , 0.8 , 0.2 , 0.3 , 0.0 , 0.8 ,0.6 , 1.0];
%velocidad derecha en metros/segundo
vR=porcentaje_vR*vnom;

%deltas de tiempos medidos en segundos
%dt=[1.0 , 2.0 , 1.0 , 0.5 , 1.5 , 1.0 , 0.75 , 2.0 , 0.5 , 2.0];
dt=[0.2 , 0.3 , 0.4 , 0.5 , 0.3 , 0.2 , 0.6 , 0.8 , 0.7 , 1.0];

t=0:0.01:sum(dt);
%velocidad idealresada a la rueda izquierda de forma ideal
vL_ideal=zeros(1,501);
vR_ideal=zeros(1,501);



for i=1:20
    vL_ideal(1,i)=vL(1,1);
    vR_ideal(1,i)=vR(1,1);
end
for i=21:50
    vL_ideal(1,i)=vL(1,2);
    vR_ideal(1,i)=vR(1,2);
end
for i=51:90
    vL_ideal(1,i)=vL(1,3);
    vR_ideal(1,i)=vR(1,3);
end
for i=91:140
    vL_ideal(1,i)=vL(1,4);
    vR_ideal(1,i)=vR(1,4);
end
for i=141:170
    vL_ideal(1,i)=vL(1,5);
    vR_ideal(1,i)=vR(1,5);
end
for i=171:190
    vL_ideal(1,i)=vL(1,6);
    vR_ideal(1,i)=vR(1,6);
end
for i=191:250
    vL_ideal(1,i)=vL(1,7);
    vR_ideal(1,i)=vR(1,7);
end
for i=251:330
    vL_ideal(1,i)=vL(1,8);
    vR_ideal(1,i)=vR(1,8);
end
for i=331:400
    vL_ideal(1,i)=vL(1,9);
    vR_ideal(1,i)=vR(1,9);
end
for i=401:501
    vL_ideal(1,i)=vL(1,10);
    vR_ideal(1,i)=vR(1,10);
end

figure('Name','Velocidades Ideales del Robot')
plot(t,vL_ideal)
hold on
plot(t,vR_ideal)
legend('Velocidad Izquierda','Velocidad Derecha')
xlabel('t [s]'),ylabel('vel [m/s]'),title('Velocidades ingresadas al Robot de forma ideal')


delta_t=0.1;
pendL=zeros(1,9);
pendR=zeros(1,9);

for i=1:9
    pendL(1,i)=(vL(1,i+1)-vL(1,i))/delta_t;
    pendR(1,i)=(vR(1,i+1)-vR(1,i))/delta_t;
end

pendL
pendR
vL_real=vL_ideal;
vR_real=vR_ideal;

for i=15:24
    vL_real(1,i)=vL_real(1,i-1)+pendL(1,1)*0.01;
    vR_real(1,i)=vR_real(1,i-1)+pendR(1,1)*0.01;
end
for i=45:54
    vL_real(1,i)=vL_real(1,i-1)+pendL(1,2)*0.01;
    vR_real(1,i)=vR_real(1,i-1)+pendR(1,2)*0.01;
end
for i=85:94
    vL_real(1,i)=vL_real(1,i-1)+pendL(1,3)*0.01;
    vR_real(1,i)=vR_real(1,i-1)+pendR(1,3)*0.01;
end
for i=135:144
    vL_real(1,i)=vL_real(1,i-1)+pendL(1,4)*0.01;
    vR_real(1,i)=vR_real(1,i-1)+pendR(1,4)*0.01;
end
for i=165:174
    vL_real(1,i)=vL_real(1,i-1)+pendL(1,5)*0.01;
    vR_real(1,i)=vR_real(1,i-1)+pendR(1,5)*0.01;
end
for i=185:194
    vL_real(1,i)=vL_real(1,i-1)+pendL(1,6)*0.01;
    vR_real(1,i)=vR_real(1,i-1)+pendR(1,6)*0.01;
end
for i=245:254
    vL_real(1,i)=vL_real(1,i-1)+pendL(1,7)*0.01;
    vR_real(1,i)=vR_real(1,i-1)+pendR(1,7)*0.01;
end
for i=325:334
    vL_real(1,i)=vL_real(1,i-1)+pendL(1,8)*0.01;
    vR_real(1,i)=vR_real(1,i-1)+pendR(1,8)*0.01;
end
for i=395:404
    vL_real(1,i)=vL_real(1,i-1)+pendL(1,9)*0.01;
    vR_real(1,i)=vR_real(1,i-1)+pendR(1,9)*0.01;
end


figure('Name','Velocidades, aceleraciones y torques')
subplot(2,2,2)
plot(t,vL_real)
hold on
plot(t,vR_real)
legend('Velocidad Izquierda','Velocidad Derecha')
xlabel('t [s]'),ylabel('vel [m/s]'),title('Velocidades reales del Robot')

aL_real=zeros(1,501);
aR_real=zeros(1,501);

for i=1:500
    aL_real(1,i)=(vL_real(1,i+1)-vL_real(1,i))/0.01;
    aR_real(1,i)=(vR_real(1,i+1)-vR_real(1,i))/0.01;
end
aL_real(1,501)=0;
aR_real(1,501)=0;
%figure('Name','Aceleraciones del Robot')
subplot(2,2,3)
plot(t,aL_real)
hold on
plot(t,aR_real)
legend('Aceleracion Izquierda','Aceleracion Derecha')
xlabel('t [s]'),ylabel('acel [m/s^2]'),title('Aceleraciones reales del Robot')

torque_L=zeros(1,501);
torque_R=zeros(1,501);

gamma_L=aL_real/r;
gamma_R=aR_real/r;

for i=1:501
    torque_R(1,i)=D11*gamma_R(1,i)+D12*gamma_L(1,i)+beta*vR_real(1,i); 
    torque_L(1,i)=D21*gamma_R(1,i)+D22*gamma_L(1,i)+beta*vL_real(1,i); 
end

torque_R=torque_R*10;
torque_L=torque_L*10;
%figure('Name','Torques necesarios de los Motores')
subplot(2,2,4)
plot(t,torque_L)
hold on
plot(t,torque_R)
legend('Torque Motor Izquierdo','Torque Motor Derecho')
xlabel('t [s]'),ylabel('Cupla [kgf.cm]'),title('Torques necesarios de los Motores')

% posL=cumsum(vL_real);
% posR=cumsum(vR_real);
%figure
posL=my_integral(0.01, vL_real);
posR=my_integral(0.01, vR_real);
subplot(2,2,1)
plot(t,posL)
hold on
plot(t,posR)
legend('Posicion Izquierda','Posicion Derecha')
%legend('Posicion Derecha')
xlabel('t [s]'),ylabel('Posicion[m]'),title('Posiciones')

%Parametrizando la masa
km=[0.5,1,2,5,10,100];
figure('Name','Parametrizacion de la masa en k')
for i=1:length(km)
   mp=m*km(1,i);
   D11p=((mp*r^2)/4) + (((Iq+mp*b^2)*r^2)/(8*a^2)) + Io;
   D22p=D11p;
   D12p=((mp*r^2)/4) - (((Iq+mp*b^2)*r^2)/(8*a^2));
   D21p=D12p;
   
   torque_Lp=zeros(1,501);
   torque_Rp=zeros(1,501);
   
   for j=1:501
       torque_Rp(1,j)=D11p*gamma_R(1,j)+D12p*gamma_L(1,j)+beta*vR_real(1,j);
       torque_Lp(1,j)=D21p*gamma_R(1,j)+D22p*gamma_L(1,j)+beta*vL_real(1,j); 
   end
   torque_Rp=torque_Rp*10;
   torque_Lp=torque_Lp*10;
   subplot(2,3,i)
   plot(t,torque_Lp)
   hold on
   plot(t,torque_Rp)
   legend('Torque Motor Izquierdo','Torque Motor Derecho')
   xlabel('t [s]'),ylabel('Cupla [kgf.cm]'),title(['Torques para k:' num2str(km(1,i))])
end


%Parametrizando la friccion
km=[0.01,0.1,1,100,10000,1000000];
figure('Name','Parametrizacion de la friccion en k')
for i=1:length(km)
   betap=beta*km(1,i);
   D11p=D11;
   D22p=D22;
   D12p=D12;
   D21p=D21;
   
   torque_Lp=zeros(1,501);
   torque_Rp=zeros(1,501);
   
   for j=1:501
       torque_Rp(1,j)=D11p*gamma_R(1,j)+D12p*gamma_L(1,j)+betap*vR_real(1,j); 
       torque_Lp(1,j)=D21p*gamma_R(1,j)+D22p*gamma_L(1,j)+betap*vL_real(1,j); 
   end
   torque_Rp=torque_Rp*10;
   torque_Lp=torque_Lp*10;
   subplot(2,3,i)
   plot(t,torque_Lp)
   hold on
   plot(t,torque_Rp)
   legend('Torque Motor Izquierdo','Torque Motor Derecho')
   xlabel('t [s]'),ylabel('Cupla [kgf.cm]'),title(['Torques para k:' num2str(km(1,i))])
end




%los 3 a mano
t_cero=[0.78,1.27,2.38];
t_T=[0.98,1.47,2.57];
f0=[0.1583,0.5755,0.8369];
fT=[0.284,0.7087,0.9274];


posRinter=posR;
for i=1:3
   a0=f0(1,i);
   a1=vR_real(1,t_cero(1,i)*100);
   a2=(3*(fT(1,i)-f0(1,i))-t_T(1,i)*(2*a1+vR_real(1,t_T(1,i)*100)))/(t_T(1,i)^2);
   a3=-(2*(fT(1,i)-f0(1,i))-t_T(1,i)*(a1+vR_real(1,t_T(1,i)*100)))/(t_T(1,i)^3);

   for j=(100*t_cero(1,i)):(t_T(1,i)*100)
       posRinter(1,j)=a0+a1*t(1,j-((t_cero(1,i)*100)-1))+a2*t(1,j-(t_cero(1,i)*100-1))^2+a3*t(1,j-(t_cero(1,i)*100-1))^3; 
   end
end

%Uno a mano 
%
% t_cero=0.78;
% t_T=0.98;
% f0=0.1583;
% fT=0.284;
% a0=f0;
% a1=vR_real(1,t_cero*100);
% a2=(3*(fT-f0)-t_T*(2*a1+vR_real(1,t_T*100)))/(t_T^2);
% a3=-(2*(fT-f0)-t_T*(a1+vR_real(1,t_T*100)))/(t_T^3);
% 
% %posRinter=zeros(length(posR));
% posRinter=posR;
% for i=79:99
%    posRinter(1,i)=a0+a1*t(1,i-78)+a2*t(1,i-78)^2+a3*t(1,i-78)^3; 
% end

figure('Name','velocidades')
subplot(2,1,1)
plot(t,posR)
hold on
plot(t,posL)
legend('Posicion Motor Derecho','Posicion Motor Izquierdo')
xlabel('t [s]'),ylabel('Vel[m/s]'),title('Velocidades reales')
subplot(2,1,2)
plot(t,posRinter)
hold on
plot(t,posL)
legend('Posicion Motor Derecho','Posicion Motor Izquierdo')
xlabel('t [s]'),ylabel('Vel[m/s]'),title('Posiciones interpoladas')


vL_real2=zeros(1,501);
vR_real2=zeros(1,501);

for i=1:500
    vL_real2(1,i)=(posL(1,i+1)-posL(1,i))/0.01;
    vR_real2(1,i)=(posRinter(1,i+1)-posRinter(1,i))/0.01;
end
vL_real2(1,501)=0;
vR_real2(1,501)=0;

aL_real2=zeros(1,501);
aR_real2=zeros(1,501);

for i=1:500
    aL_real2(1,i)=(vL_real2(1,i+1)-vL_real2(1,i))/0.01;
    aR_real2(1,i)=(vR_real2(1,i+1)-vR_real2(1,i))/0.01;
end
aL_real2(1,501)=0;
aR_real2(1,501)=0;

gamma2_L=aL_real2/r;
gamma2_R=aR_real2/r;

for i=1:501
    torque2_R(1,i)=D11*gamma2_R(1,i)+D12*gamma2_L(1,i)+beta*vR_real2(1,i); 
    torque2_L(1,i)=D21*gamma2_R(1,i)+D22*gamma2_L(1,i)+beta*vL_real2(1,i); 
end

torque2_R=torque2_R*10;
torque2_L=torque2_L*10;

figure('Name','Graficos luego de interpolar')
subplot(2,2,4)
plot(t,torque2_L)
hold on
plot(t,torque2_R)
legend('Torque Motor Izquierdo','Torque Motor Derecho')
xlabel('t [s]'),ylabel('Cupla [kgf.cm]'),title('Torques necesarios de los Motores')

subplot(2,2,1)
plot(t,posL)
hold on
plot(t,posRinter)
legend('Posicion Motor Izquierdo','Posicion Motor Derecho')
xlabel('t [s]'),ylabel('Posicion [m]'),title('Posiciones de los motores')

subplot(2,2,2)
plot(t,vL_real2)
hold on
plot(t,vR_real2)
legend('Velocidad Motor Izquierdo','Velocidad Motor Derecho')
xlabel('t [s]'),ylabel('Velocidad [m/s]'),title('Velocidad de los motores')

subplot(2,2,3)
plot(t,aL_real2)
hold on
plot(t,aR_real2)
legend('Aceleracion Motor Izquierdo','Aceleracion Motor Derecho')
xlabel('t [s]'),ylabel('Aceleracion [m/s]'),title('Aceleracion de los motores')

