function a=atan_corregida(y, x)
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

if x > 0
    a=atan(y/x);
    return;
end

if (x < 0 && y < 0)
    a=atan(y/x) - pi;
else 
    a=atan(y/x) + pi;
end

end