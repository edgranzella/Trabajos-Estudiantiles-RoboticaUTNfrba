%function [vectw,t]=gen_de_vel_y_ac(wi,wf,tmp)%genera velocidad y aceleracion
%ingresando upd=1:up,0:down
%el tiempo y la velocidad final
clear all
wi=0.5;
wf=0.4;
dt=0.01;
aux=0.00001;
t(1)=0;
vectw(1)=0;
ac(1)=0;

if wf>wi
    a=wf-wi;
else
    a=wi-wf;
end
aux1=(a/dt)
for i=1:round(aux1+1)%redondea a entero.
    if i==1
        %if(wi<wf)
            vectw(i)=wi;
        %else
        %    vectw(i)=wf;
        %end
    else
        aux=aux+dt;
        if(wi<wf)
            vectw(i)=wi+aux;
        else
            vectw(i)=wi-aux;
        end
    end
    if i==1
        ac(i)=0
    else
        ac(i)=(vectw(i-1)-vectw(i))/(t(i-1)-aux);
    end
    t(i)=aux;
end
ac(1)=ac(2);
plot(t,vectw)
hold on
plot(t,ac)
