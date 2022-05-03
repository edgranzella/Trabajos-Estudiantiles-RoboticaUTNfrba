clear all
%variables:
%Cota de rueda a rueda
l=11;%[cm]
%radio de rueda
r=2.94;%[cm]
%masa
m=673.21;%[g]
%centro de gravedad
b=3.910; %[cm] - X = 39.10mm
%momento de inercia del robot con respecto a Q
IQ=12810.9813;%[cm^2*g] - Ixz = 1281098.13[mm^2*g]
%momento de inercia de las ruedas del robot
I0=487.4235;%[cm^2*g]%Ixz = 48742.35[mm^2*g]
%fricción
beta=35*10.^(-7)*100*1000/9.81;%[N*m*s/rad]->0.0357[g*cm*s/rad]
%velocidad angular porcentual:
wdp=[1 1];
wip=[1 1];
%Duración de cada velocidad:
dt=[5 5];
%repeticiones de la trayectoria:
repet=1;
%segmentos de la trayectoria:
segtr=2;
%variable tiempo
tmp=0;

%se generan los parametros de la matriz
d11=m*r.^2*(1/4)+(IQ+m*b.^2)*r.^2/(8*(l/2).^2)+I0;
d12=m*r.^2*(1/4)-(IQ+m*b.^2)*r.^2/(8*(l/2).^2);
d22=d11;
d21=d12;
%se genera el vector de velocidad, aceleración y tiempo
[wd,acd,tmp1,cnt1]=armado_vyc(wdp,dt,segtr,repet);%se debe indicar en el ultimo valor la cantidad de repeticiones de la trayectoria.
[wi,aci,tmp2,cnt2]=armado_vyc(wip,dt,segtr,repet);
%se comparan las cuentas y se elige la menor.
if cnt1<cnt2
    cntaux=cnt1;
    tmpaux=tmp1;
else
    cntaux=cnt2;
    tmpaux=tmp2;
end
%se generan los torques:
%9,81 N*m = 1 kgf*m
for i=1:cntaux
        torqd(i)=[d11*acd(i)+d12*aci(i)+beta*wd(i)]*0.00001*9.81;%g*cm*0.001*0.01*9.81=N*m
        torqi(i)=[d21*acd(i)+d22*aci(i)+beta*wi(i)]*0.00001*9.81;%g*cm*0.001*0.01*9.81=N*m
end
%Torque nominal del motor:
torqn=5*0.01*9.81;%kg-cm*0.01*9.81=N*m;
%torque maximo:
torqmax=torqn*5;
grid on
%se plotean los resultados:
i=1:0.01:30;
subplot(2,3,1)
    plot(tmpaux,torqd, '-b','linewidth', 1.5)
    
    xlabel('Torque rueda derecha.')
    hold on
    plot(tmpaux,torqmax, '-g','linewidth', 1.5)
    plot(tmpaux,-torqmax, '-g','linewidth', 1.5)
    legend('Torque rueda derecha','Torque máximo');
subplot(2,3,2)
    plot(tmp1,wd,'linewidth', 1.5)
    xlabel('Velocidad angular rueda derecha.')
subplot(2,3,3)
    plot(tmp1,acd,'linewidth', 1.5)
    xlabel('Aceleración angular rueda derecha.')
subplot(2,3,4)
    plot(tmpaux,torqi, '-b','linewidth', 1.5)
    xlabel('Torque rueda irquierda.')
    hold on
    plot(tmpaux,torqmax, '-g','linewidth', 1.5)
    plot(tmpaux,-torqmax, '-g','linewidth', 1.5)
    legend('Torque rueda izquierda','Torque máximo');
subplot(2,3,5)
    plot(tmp2,wi, '-b','linewidth', 1.5)
    xlabel('Velocidad angular rueda izquierda.')
subplot(2,3,6)
    plot(tmp2,aci, '-b','linewidth', 1.5)
    xlabel('Aceleración angular rueda izquierda.')
