function P = plot_arc(qi,qf,cx,cy,r, Array)
% Dibuja un arco de circunferencia en una estructura de arrays.
% qi es el ángulo de inicio en radianes, 
% qf es el ángulo de fin en radianes, 
% (cx,cy) es el centro de la circunferencia.
% r es el radio.

%genera un vector de 100 valores en radianes 
%que sirve de parámetro para barrer la curva.
%[q qd qdd] = jtraj(qi, qf, 100);
%t = q';

%lo de antes
t = linspace(qi,qf);

%Ecuación de la circunferencia. Se barre parcialmente de acuerdo a t.
x = r*cos(t) + cx;
y = r*sin(t) + cy;

%Agrego el arco a la trayectoria dentro de la estructura.
P.x = [Array.x x];
P.y = [Array.y y];

%copio el vector de velocidades a la salida.
P.v = Array.v;

%Actualizo el contador de puntos que tiene la trayectoria.
s = size(t);
P.ind = Array.ind + s(1,2); 

%Mensaje de error si no hay argumentos
if ~nargout
    display('Función plot_arc() - Se requieren argumentos')
    return;
end