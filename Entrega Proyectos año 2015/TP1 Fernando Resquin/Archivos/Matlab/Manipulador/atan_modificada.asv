function a=atan_modificada(y, x)
if x==0
    %Protección para que no de infinito
    if y>0
        a=pi/2;
    else
        a=-pi/2;
    end
    return;
end
%Determina a qué cuadrante correspondería el resultado
if sign(x)==sign(y)
    if sign(y)==-1
        a=atan(y/x)+pi;
    else
        a=atan(y/x);
    end
else
    if sign(y)==-1
        a=atan(y/x);
    else
        a=atan(y/x)+pi;
    end 
end
end