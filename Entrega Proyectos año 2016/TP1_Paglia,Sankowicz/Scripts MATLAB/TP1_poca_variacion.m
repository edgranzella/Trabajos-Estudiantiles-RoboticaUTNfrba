
%%%%Robotica: TP1 Cinematica del Robot N6%%%%
clear all;
close all;
clc



%distancia entre ruedas en metros
l=13.5/100;
%radio de la rueda en metros
r=0.03;
%circunferencia en metros
circ=2*pi*r;
%velocidad nominal en rpm
vnomrpm=200;
%velocidad nominal en metros/segundo
vnom=vnomrpm*circ/60;


%-----------CALCULOS PRELIMINARES-------------
%porcentaje de la velocidad nominal para cada rueda 
%porcentaje_vl=0.5;
%porcentaje_vr=1.0;

%tiempo de operacion de los motores en segundos
%delta_T=2;
%vl=porcentaje_vl*vnom;
%vr=porcentaje_vr*vnom;
%radio del centro de giro (CIR)
%R=l*(vl+vr)/((vl-vr)*2);
%velocidad angular respecto del centro de giro (CIR)
%w=(vr-vl)/l;


%-----------Vectores de velocidades y tiempos-------------
%velocidad izquierda en porcentaje de la nominal
porcentaje_vL=[0.1 , 0.2 , 0.3 , 0.4 , 0.5 , 0.6 , 0.2 , 0.7 ,0.7 , 0.9];
%velocidad izquierda en metros/segundo
vL=porcentaje_vL*vnom

%velocidad derecha en porcentaje de la nominal
porcentaje_vR=[0.2 , 0.1 , 0.5 , 0.5 , 0.2 , 0.4 , 0.0 , 0.8 ,0.9 , 1.0];
%velocidad derecha en metros/segundo
vR=porcentaje_vR*vnom

nL=[4,5,11,21,15,13,13,60,55,101];
nR=[4,3,20,28,7,7,7,69,73,117];

%deltas de tiempos medidos en segundos
%dt=[1.0 , 2.0 , 1.0 , 0.5 , 1.5 , 1.0 , 0.75 , 2.0 , 0.5 , 2.0];
dt=[0.2 , 0.3 , 0.4 , 0.5 , 0.3 , 0.2 , 0.6 , 0.8 , 0.7 , 1.0];
%-----------Calculo de las velocidades angulares-------------
w=(vR-vL)/l
%-----------Calculo de los R elemento a elemento-------------
R=(l/2)*(vR+vL)./(vR-vL)
%-----------Calculo de wdt elemento a elemento-------------
wdt=w.*dt

%-----------Valores iniciales-------------
X0=0;
Y0=0;
thita0=0;


%-----------Planteo del modelo con ciclo for-------------
%Declaro tres vectores, Xp,Yp,THITAp (para las distintas posiciones)
Xp=[0 0 0 0 0 0 0 0 0 0];
Yp=[0 0 0 0 0 0 0 0 0 0];
THITAp=[0 0 0 0 0 0 0 0 0 0];

X=0;
Y=0;
THITA=pi/4;
v=vL;


for i=1:length(vL)
    A=[cos(wdt(1,i)) -sin(wdt(1,i)) 0 ; sin(wdt(1,i)) cos(wdt(1,i)) 0 ; 0 0 1];     
    ICCx=X-R(1,i)*sin(THITA);
    ICCy=Y+R(1,i)*cos(THITA);
    B=[X-ICCx;Y-ICCy;THITA];
    C=[ICCx;ICCy;wdt(1,i)];
    P=A*B+C;
    X=P(1,1);
    Xp(1,i)=P(1,1);
    Y=P(2,1);
    Yp(1,i)=P(2,1);
    THITA=P(3,1);
    THITAp(1,i)=P(3,1);
end

% for i=1:length(vL)
%     Xp(1,i)=X+v(1,i)*sin(THITA)*dt(1,i);
%     Yp(1,i)=Y+v(1,i)*cos(THITA)*dt(1,i);
%     X=Xp(1,i);
%     Y=Yp(1,i);
%     THITAp(1,i)=THITA;
% end

Xp
Yp
THITAp
% plot(Xp,Yp,'--or');
% title('Modelo Cinematico: Pequeños dV')
% xlabel('X[m]')
% ylabel('Y[m]')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%Medido con encoders del N6%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cambios=32; 
angulo_cambio=360/cambios;
step=angulo_cambio*pi/180*0.03;

nL=[4,5,11,21,15,13,13,60,55,101];
nR=[4,3,20,28,7,7,7,69,73,117];

vR_m=nR.*step./dt;
vL_m=nL.*step./dt;
%err_vL=abs(vL-vL_m);
%err_vR=abs(vR-vR_m);
err_vL=vL_m-vL;
err_vR=vR_m-vR;
factor_vR=mean(err_vR)
factor_vL=mean(err_vL)

%correción del error
%
% factor_vL=0.0040;
% factor_vR=0.0135;

vLcorregida=vL_m*(1-factor_vL);
vRcorregida=vR_m*(1-factor_vR);

figure('Name','Velocidad Derecha: Teorica, Medida y Corregida')
plot(vR,'-o')
hold on
plot(vR_m,'-s')
plot(vRcorregida,'-dk')
legend('Velocidad Teorica','Velocidad Medida','Velocidad Corregida')
xlabel('n'),ylabel('velocidad [m/s]'),title('Velocidad Derecha: Teorica, Medida y Corregida')

figure('Name','Velocidad Izquierda: Teorica, Medida y Corregida')
plot(vL,'-o')
hold on
plot(vL_m,'-s')
plot(vLcorregida,'-dk')
legend('Velocidad Teorica','Velocidad Medida','Velocidad Corregida')
xlabel('n'),ylabel('velocidad [m/s]'),title('Velocidad Izquierda: Teorica, Medida y Corregida')



err_vL2=vLcorregida-vL;
err_vR2=vRcorregida-vR;

media2_err_vR=mean(err_vR2)
media2_err_vL=mean(err_vL2)



wdt_m=(nR-nL)*step/l;

R_m=(l/2)*(nR+nL)./(nR-nL);

%Condiciones Iniciales
X_m=0;
Y_m=0;
THITA_m=pi/4;

Xp_m=[0 0 0 0 0 0 0 0 0 0];
Yp_m=[0 0 0 0 0 0 0 0 0 0];
THITAp_m=[0 0 0 0 0 0 0 0 0 0];

for i=1:length(nL)
   if nR(1,i)==nL(1,i)
       Xp_m(1,i)=X_m+nR(1,i)*step/dt(1,i)*sin(THITA_m);
       Yp_m(1,i)=Y_m+nR(1,i)*step/dt(1,i)*cos(THITA_m);
       THITAp_m(1,i)=THITA_m;
       X=Xp_m(1,i);
       Y=Xp_m(1,i);
    else
       A=[cos(wdt_m(1,i)) -sin(wdt_m(1,i)) 0 ; sin(wdt_m(1,i)) cos(wdt_m(1,i)) 0 ; 0 0 1];
       ICCx=X_m-R_m(1,i)*sin(THITA_m);
       ICCy=Y_m+R_m(1,i)*cos(THITA_m);
       B=[X_m-ICCx;Y_m-ICCy;THITA_m];
       C=[ICCx;ICCy;wdt_m(1,i)];
       P=A*B+C;
       X_m=P(1,1);
       Xp_m(1,i)=P(1,1);
       Y_m=P(2,1);
       Yp_m(1,i)=P(2,1);
       THITA_m=P(3,1);
       THITAp_m(1,i)=P(3,1);
   end
end
Xp_m
Yp_m
THITAp_m

figure('Name','Modelo Cinematico: Pocas Variaciones')
hold on
title('Modelo Cinematico: Pocas Variaciones')
plot(Xp,Yp,'--or');
plot(Xp_m,Yp_m,'-ob');
% plot(Xp_m,Yp_m,'-ob');
% title('Mediciones: Pocas variaciones de velocidad')
xlabel('X[m]')
ylabel('Y[m]')
legend('Teorico','Mediciones')


figure('Name','Errores en Poca Variacion')
hold on
title('Errores en Poca Variacion')
plot(err_vL,'--or');
plot(err_vR,'-ob');
xlabel('n')
ylabel('error[m/s]')
legend('Error Velocidad Izquierda','Error Velocidad Derecha')


