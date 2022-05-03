function [vectw,ac,tmps,cnt]=gen_de_vel_y_ac2(wi,tmp,tmpi);
%genera el vector de velocidad y aceleracion cte, y se ingresa la velocidad
%inicial (wi), el tiempo que va a durar la velocidad ingresada (tmp) y 
%el tiempo inicial (tmpi).

%el tiempo y la velocidad final
cnt=round(tmp/0.01);
tmps(1)=tmpi+0.01;
aux=wi*(200/60)*2*pi;
for i=1:cnt
    vectw(i)=aux;%de rpm a radianes/s
    ac(i)=0;
    if i~=1%tiempo de salida con respecto a tiempo de entrada
        tmps(i)=tmps(i-1)+0.01;
    end
end