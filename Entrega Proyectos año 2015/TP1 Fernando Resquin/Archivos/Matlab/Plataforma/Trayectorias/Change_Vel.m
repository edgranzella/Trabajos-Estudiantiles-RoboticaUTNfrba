function P = Change_Vel(vi, vf, N_points, Array)
%Dado el array de puntos de la trajectora creada
%en (x, y), asigna las velocidades instant�neas
%de plataforma para cada punto. Genera perfiles
%de aceleraci�n, desaceleraci�n y vel. cte.

%Uso la funci�n de Corke de interpolaci�n polin�mica de 7� grado
[vel acc jerk] = jtraj(vi, vf, N_points); 
%Copio los campos de larray de entrada a la salida
P.x = Array.x;
P.y = Array.y;
P.v = Array.v;
P.ind = Array.ind; 
%Agrego el tramo generado al array de vel. dentro de la estructura
P.v = [Array.v vel'];
%Mensaje de error si no hay argumentos
if ~nargout
    display('Funci�n plot_arc() - Se requieren argumentos')
    return;
end