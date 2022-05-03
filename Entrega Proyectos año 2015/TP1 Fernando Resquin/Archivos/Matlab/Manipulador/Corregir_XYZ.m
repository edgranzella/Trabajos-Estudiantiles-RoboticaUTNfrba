function XYZc =  Corregir_XYZ(Xp, Yp, Zp, Rot_Angle, Dx, Dy, Dz)
%Armo la matriz de rotaci�n que rota el espacio en -Rot_Angle
Rt = [cos(-Rot_Angle) -sin(-Rot_Angle) 0 ; sin(-Rot_Angle) cos(-Rot_Angle) 0 ; 0 0 1];
%vector de translaci�n que posee la misma direcci�n que el ingresado
%pero sentido contrario
Tt = [-Dx ;-Dy ;-Dz];
%Primero translado y luego roto el punto (Xp, Yp, Zp) ingresado, y lo
%entrego a la salida
XYZc= Rt*(Tt + [Xp; Yp; Zp]);


