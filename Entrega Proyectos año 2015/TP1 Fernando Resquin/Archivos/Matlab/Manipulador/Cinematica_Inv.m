function [qi1 qi2 qi3 status] = Cinematica_Inv(Px, Py, Pz, L1, L2, L3, Q2_MAX, Q2_MIN)

%Inicializo variables
status = 0;
qi2=0;
qi3=0;
%Calculo q1
qi1=atan_modificada(Py,Px);

%Determino las "constantes" a, b, c
a = Px*cos(qi1) + Py*sin(qi1);
b = Pz - L1;
c = (a^2 + b^2 - L3^2 + L2^2)/(2*L2);

%Calculo q2, decidiendo entre los 2 valores seg?n Q2_MAX y Q2_MIN
if (b^2 + a^2 - c^2) >= 0
    q2a=atan_modificada(b + sqrt(b^2 + a^2 - c^2),(a + c));
    q2b=atan_modificada(b - sqrt(b^2 + a^2 - c^2),(a + c));
    if q2a <= Q2_MAX && q2a >= Q2_MIN
    qi2=2*q2a; 
    elseif q2b <= Q2_MAX && q2b >= Q2_MIN
    qi2=2*q2b; 
    else
    status=30;%Se gener? error 30    
    end    
else
    status=20;%Se gener? error 20
end

%Calculo q3
if ((sin(qi2)*b + cos(qi2)*a) ~= L2)
qi3 = atan_modificada((cos(qi2)*b - sin(qi2)*a),(sin(qi2)*b + cos(qi2)*a - L2));
else
status=40;%Se gener? error 40
end 




