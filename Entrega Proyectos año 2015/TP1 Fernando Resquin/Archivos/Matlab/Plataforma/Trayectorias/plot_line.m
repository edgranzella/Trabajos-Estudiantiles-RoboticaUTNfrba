function P = plot_line(x1,y1,x2,y2, Array)
% Dibuja una recta en una estructura de arrays.
%(x1,y1) es el punto inicial
%(x2,y2) es el punto final

%A partir de los puntos extremos de la recta se determinan los
%coeficientes de la misma. Se detecta si es una línea vertical u horizontal
%y se actúa en consecuencia. Se determina el vector paramétrico t.
if ((x2 - x1) ~= 0)
    v1=1;
    k= (x2 - x1)/v1;
    v2=(y2 - y1)/k;
    t = linspace(0,k);
elseif ((y2 - y1) ~= 0)
    v2=1;
    k= (y2 - y1)/v2;
    v1=(x2 - x1)/k;
    t = linspace(0,k);
else    
    return;   
end

%Ecuación de la recta. Se barre de acuerdo a t.
x = v1*t + x1;
y = v2*t + y1;

%Agrego el segmento rectilíneo a la trayectoria dentro de la estructura.
P.x = [Array.x x];
P.y = [Array.y y];

%copio el vector de velocidades a la salida.
P.v = Array.v;

%Actualizo el contador de puntos que tiene la trayectoria.
s = size(t);
P.ind = Array.ind + s(1,2); 

%Mensaje de error si no hay argumentos
if ~nargout
    display('Función plot_line() - Se requieren argumentos')
    return;
end