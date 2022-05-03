function H = Trayectoria1(Tray)

%Genero el 1° tramo rectilíneo
Tray = plot_line(0,0,10,0,Tray);
Tray = Change_Vel(0.001, 3.5, 30, Tray);%acel
Tray = Change_Vel(3.5, 3.5, 40, Tray);%velocidad de recorrido
Tray = Change_Vel(3.5, 1, 30, Tray);%desac

%Genero la 1° curva
Tray = plot_arc(pi/2,0,10,-3,3, Tray);
Tray = Change_Vel(1, 1, 100, Tray);%velocidad de recorrido

%Genero el 2° tramo rectilíneo
Tray = plot_line(13,-3,13,-10,Tray);
Tray = Change_Vel(1, 2.5, 30, Tray);%acel
Tray = Change_Vel(2.5, 2.5, 40, Tray);%velocidad de recorrido
Tray = Change_Vel(2.5, 1.5, 30, Tray);%desac

%Genero la 2° curva
Tray = plot_arc(-pi,-pi/2,17,-10,4, Tray);
Tray = Change_Vel(1.5, 1.5, 100, Tray);%velocidad de recorrido

%Genero el 3° tramo rectilíneo
Tray = plot_line(17,-14,30,-14,Tray);
Tray = Change_Vel(1.5, 3.5, 30, Tray);%acel
Tray = Change_Vel(3.5, 3.5, 40, Tray);%velocidad de recorrido
Tray = Change_Vel(3.5, 2.5, 30, Tray);%desac

%Genero la 3° curva
Tray = plot_arc(-pi/2,0,30,-9,5, Tray);
Tray = Change_Vel(2.5, 2.5, 100, Tray);%velocidad de recorrido

%Genero el 4° tramo rectilíneo
Tray = plot_line(35,-9,35,20,Tray);
Tray = Change_Vel(2.5, 5, 30, Tray);%acel
Tray = Change_Vel(5, 5, 40, Tray);%velocidad de recorrido
Tray = Change_Vel(5, 3, 30, Tray);%desac

%Genero la 4° curva
Tray = plot_arc(0,pi,27,20,8, Tray);
Tray = Change_Vel(3, 3, 100, Tray);%velocidad de recorrido

%Genero la 4° curva
Tray = plot_arc(0,-pi,10.5,20,8.5, Tray);
Tray = Change_Vel(3, 3, 100, Tray);%velocidad de recorrido

%Genero el 5° tramo rectilíneo
Tray = plot_line(2,20,2,40,Tray);
Tray = Change_Vel(3, 4, 30, Tray);%acel
Tray = Change_Vel(4, 4, 40, Tray);%velocidad de recorrido
Tray = Change_Vel(4, 3, 30, Tray);%desac

%Genero la 5° curva
Tray = plot_arc(0,pi,-8,40,10, Tray);
Tray = Change_Vel(3, 3, 100, Tray);%velocidad de recorrido

%Genero el 6° tramo rectilíneo
Tray = plot_line(-18,40,-18,20,Tray);
Tray = Change_Vel(3, 4, 30, Tray);%acel
Tray = Change_Vel(4, 4, 40, Tray);%velocidad de recorrido
Tray = Change_Vel(4, 1, 30, Tray);%desac

%Genero la 6° curva
Tray = plot_arc(0,-pi/2,-21,20,3, Tray);
Tray = Change_Vel(1, 1, 100, Tray);%velocidad de recorrido

%Genero el 7° tramo rectilíneo
Tray = plot_line(-21,17,-30,17,Tray);
Tray = Change_Vel(1, 3, 30, Tray);%acel
Tray = Change_Vel(3, 3, 40, Tray);%velocidad de recorrido
Tray = Change_Vel(3, 2.5, 30, Tray);%desac

%Genero la 7° curva
Tray = plot_arc(pi/2,pi,-30,12,5, Tray);
Tray = Change_Vel(2.5, 2.5, 100, Tray);%velocidad de recorrido

%Genero el 8° tramo rectilíneo
Tray = plot_line(-35,12,-35,-30,Tray);
Tray = Change_Vel(2.5, 5, 30, Tray);%acel
Tray = Change_Vel(5, 5, 40, Tray);%velocidad de recorrido
Tray = Change_Vel(5, 3.5, 30, Tray);%desac

%Genero la 8° curva
Tray = plot_arc(-pi,0,-25,-30,10, Tray);
Tray = Change_Vel(3.5, 3.5, 100, Tray);%velocidad de recorrido

%Genero la 9° curva
Tray = plot_arc(pi, 0, -5,-30,10, Tray);
Tray = Change_Vel(3.5, 3.5, 70, Tray);%velocidad de recorrido
Tray = Change_Vel(3.5, 2.5, 30, Tray);%desac

%Genero la 10° curva
Tray = plot_arc(-pi, -pi/2, 10,-30,5, Tray);
Tray = Change_Vel(2.5, 2.5, 100, Tray);

%Genero el 9° tramo rectilíneo
Tray = plot_line(10,-35,40,-35,Tray);
Tray = Change_Vel(2.5, 3.5, 30, Tray);%acel
Tray = Change_Vel(3.5, 3.5, 40, Tray);%velocidad de recorrido
Tray = Change_Vel(3.5, 0.01, 30, Tray);%desac y FIN DE TRAYECTORIA



%Eliminar elementos repetidos. No debe haber 2 puntos consecutivos
%del vector con las mismas coordenadas x, y.
i=2;
barrer = 0;
while (barrer == 0)
    if(i ==  length(Tray.x))
    barrer = 1;    
    else
        if(Tray.x(i) == Tray.x(i-1))
            Tray.x(i)=[];%Igualando a "[]" elimino el elemento
            Tray.y(i)=[];
            Tray.v(i)=[];
            Tray.ind = length(Tray.x);%Corrijo el nro de posiciones de Tray
        end
    i = i + 1;
    end
    
end
H.x = Tray.x;
H.y = Tray.y;
H.v = Tray.v;
H.ind = Tray.ind; 
if ~nargout
    display('Función plot_arc() - Se requieren argumentos')
    return;
end
