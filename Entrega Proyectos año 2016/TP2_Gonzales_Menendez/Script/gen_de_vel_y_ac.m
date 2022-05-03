function [vectw,ac,t,cnt]=gen_de_vel_y_ac(wi,wf,tmpinic,aci)%genera velocidad,
%aceleración y tiempo, 
%wi: velocidad inicial en porcentaje.
%wf: velocidad final en porcentaje.
%tmpinic: tiempo en el que se inicia la pendiente.
%aci: aceleración inicial.

%velocidad al 100%
wt=(200/60)*2*pi;%rad/s
%tiempo en el que crece wt (para no pasar el valor maximo de torque, se
%debe modificar este valor):
tdwt=3;
%velocidades:
wi2=wi*wt;
wf2=wf*wt;
%tiempo de escalon de crecimiento:
dt=0.01;
%inicializacion de valor de velocidad del escalon:
dw=0;
%inicializacion del vector de velocidad, aceleracion y tiempo:
vectw=[0];
ac=[0];
t=[0];
%rampa total que debe crecer la velocidad:
if wf>wi
    a=wf2-wi2;
else
    a=wi2-wf2;
end
%cantidad de escalones que debe hacer la rampa:
cnt=round((a*tdwt/wt)/dt);
%crecimiento de la vel. ang. entre cada dt.
dw=a/cnt;

if wf==wi
   vectw(1)=wi2;%de rpm a radianes/s
   t(1)=tmpinic+dt;
   ac(1)=aci;
   cnt=1;
else
    for i=1:cnt%redondea a entero.
        if(wi2<wf2)
            vectw(i)=wi2+dw*i;% rpm a radianes/s
        end
        if(wi2>wf2)
            vectw(i)=wi2-dw*i;%de rpm a radianes/s
        end
        if i==1
            t(i)=tmpinic+dt;
            ac(i)=aci;
        else
            t(i)=t(i-1)+dt;
            ac(i)=(vectw(i)-vectw(i-1))/(t(i)-t(i-1));
        end     
    end
end