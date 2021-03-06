function H = Trayectoria1(Tray)
%Tramo rectil?neo
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 3.5,30, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 3.5,100 - 30 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(3.5 , 1.0,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Last_Y = Tray.y(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_line(Last_X,Last_Y,Last_X + 10.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 2)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + 10.0,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 3)
Tray = plot_line(Last_X,Last_Y,Last_X - 10.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 4)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - 10.0,Tray);%Trazo el tramo de trayectoria
end
%Giro a la derecha
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 1.0,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 1.0,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(1.0 , 1.0,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(pi/2,0,Last_X,Last_Y - 3.0,3.0, Tray);%Trazo curva a la derecha
end
if(Orient == 2)
Tray = plot_arc(pi,pi/2,Last_X + 3.0,Last_Y,3.0, Tray);%Trazo curva a la derecha
end
if(Orient == 3)
Tray = plot_arc(-pi/2,-pi,Last_X,Last_Y + 3.0,3.0, Tray);%Trazo curva a la derecha
end
if(Orient == 4)
Tray = plot_arc(0,-pi/2,Last_X - 3.0,Last_Y,3.0, Tray);%Trazo curva a la derecha
end
%Tramo rectil?neo
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 2.5,30, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 2.5,100 - 30 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(2.5 , 1.5,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Last_Y = Tray.y(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_line(Last_X,Last_Y,Last_X + 7.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 2)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + 7.0,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 3)
Tray = plot_line(Last_X,Last_Y,Last_X - 7.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 4)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - 7.0,Tray);%Trazo el tramo de trayectoria
end
%Giro a la izquierda
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 1.5,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 1.5,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(1.5 , 1.5,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(-pi/2,0,Last_X,Last_Y + 4.0,4.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 2)
Tray = plot_arc(0,pi/2,Last_X - 4.0,Last_Y,4.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 3)
Tray = plot_arc(pi/2,pi,Last_X,Last_Y - 4.0,4.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 4)
Tray = plot_arc(-pi,-pi/2,Last_X + 4.0,Last_Y,4.0, Tray);%Trazo curva a la izquierda
end
%Tramo rectil?neo
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 3.5,30, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 3.5,100 - 30 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(3.5 , 2.5,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Last_Y = Tray.y(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_line(Last_X,Last_Y,Last_X + 13.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 2)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + 13.0,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 3)
Tray = plot_line(Last_X,Last_Y,Last_X - 13.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 4)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - 13.0,Tray);%Trazo el tramo de trayectoria
end
%Giro a la izquierda
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 2.5,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 2.5,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(2.5 , 2.5,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(-pi/2,0,Last_X,Last_Y + 5.0,5.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 2)
Tray = plot_arc(0,pi/2,Last_X - 5.0,Last_Y,5.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 3)
Tray = plot_arc(pi/2,pi,Last_X,Last_Y - 5.0,5.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 4)
Tray = plot_arc(-pi,-pi/2,Last_X + 5.0,Last_Y,5.0, Tray);%Trazo curva a la izquierda
end
%Tramo rectil?neo
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 5.0,30, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 5.0,100 - 30 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(5.0 , 3.0,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Last_Y = Tray.y(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_line(Last_X,Last_Y,Last_X + 29.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 2)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + 29.0,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 3)
Tray = plot_line(Last_X,Last_Y,Last_X - 29.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 4)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - 29.0,Tray);%Trazo el tramo de trayectoria
end
%Giro a la izquierda
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 3.0,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 3.0,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(3.0 , 3.0,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(-pi/2,pi/2,Last_X,Last_Y + 8.0,8.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 2)
Tray = plot_arc(0,pi,Last_X - 8.0,Last_Y,8.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 3)
Tray = plot_arc(pi/2,1.5*pi,Last_X,Last_Y - 8.0,8.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 4)
Tray = plot_arc(-pi,0,Last_X + 8.0,Last_Y,8.0, Tray);%Trazo curva a la izquierda
end
%Giro a la derecha
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 3.0,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 3.0,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(3.0 , 3.0,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(pi/2,-pi/2,Last_X,Last_Y - 8.5,8.5, Tray);%Trazo curva a la derecha
end
if(Orient == 2)
Tray = plot_arc(pi,0,Last_X + 8.5,Last_Y,8.5, Tray);%Trazo curva a la derecha
end
if(Orient == 3)
Tray = plot_arc(1.5*pi,pi/2,Last_X,Last_Y + 8.5,8.5, Tray);%Trazo curva a la derecha
end
if(Orient == 4)
Tray = plot_arc(0,-pi,Last_X - 8.5,Last_Y,8.5, Tray);%Trazo curva a la derecha
end
%Tramo rectil?neo
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 4.0,30, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 4.0,100 - 30 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(4.0 , 3.0,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Last_Y = Tray.y(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_line(Last_X,Last_Y,Last_X + 20.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 2)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + 20.0,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 3)
Tray = plot_line(Last_X,Last_Y,Last_X - 20.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 4)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - 20.0,Tray);%Trazo el tramo de trayectoria
end
%Giro a la izquierda
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 3.0,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 3.0,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(3.0 , 3.0,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(-pi/2,pi/2,Last_X,Last_Y + 10.0,10.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 2)
Tray = plot_arc(0,pi,Last_X - 10.0,Last_Y,10.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 3)
Tray = plot_arc(pi/2,1.5*pi,Last_X,Last_Y - 10.0,10.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 4)
Tray = plot_arc(-pi,0,Last_X + 10.0,Last_Y,10.0, Tray);%Trazo curva a la izquierda
end
%Tramo rectil?neo
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 4.0,30, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 4.0,100 - 30 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(4.0 , 1.0,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Last_Y = Tray.y(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_line(Last_X,Last_Y,Last_X + 20.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 2)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + 20.0,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 3)
Tray = plot_line(Last_X,Last_Y,Last_X - 20.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 4)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - 20.0,Tray);%Trazo el tramo de trayectoria
end
%Giro a la derecha
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 1.0,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 1.0,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(1.0 , 1.0,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(pi/2,0,Last_X,Last_Y - 3.0,3.0, Tray);%Trazo curva a la derecha
end
if(Orient == 2)
Tray = plot_arc(pi,pi/2,Last_X + 3.0,Last_Y,3.0, Tray);%Trazo curva a la derecha
end
if(Orient == 3)
Tray = plot_arc(-pi/2,-pi,Last_X,Last_Y + 3.0,3.0, Tray);%Trazo curva a la derecha
end
if(Orient == 4)
Tray = plot_arc(0,-pi/2,Last_X - 3.0,Last_Y,3.0, Tray);%Trazo curva a la derecha
end
%Tramo rectil?neo
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 3.0,30, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 3.0,100 - 30 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(3.0 , 2.5,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Last_Y = Tray.y(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_line(Last_X,Last_Y,Last_X + 9.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 2)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + 9.0,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 3)
Tray = plot_line(Last_X,Last_Y,Last_X - 9.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 4)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - 9.0,Tray);%Trazo el tramo de trayectoria
end
%Giro a la izquierda
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 2.5,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 2.5,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(2.5 , 2.5,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(-pi/2,0,Last_X,Last_Y + 5.0,5.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 2)
Tray = plot_arc(0,pi/2,Last_X - 5.0,Last_Y,5.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 3)
Tray = plot_arc(pi/2,pi,Last_X,Last_Y - 5.0,5.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 4)
Tray = plot_arc(-pi,-pi/2,Last_X + 5.0,Last_Y,5.0, Tray);%Trazo curva a la izquierda
end
%Tramo rectil?neo
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 5.0,30, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 5.0,100 - 30 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(5.0 , 3.5,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Last_Y = Tray.y(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_line(Last_X,Last_Y,Last_X + 42.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 2)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + 42.0,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 3)
Tray = plot_line(Last_X,Last_Y,Last_X - 42.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 4)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - 42.0,Tray);%Trazo el tramo de trayectoria
end
%Giro a la izquierda
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 3.5,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 3.5,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(3.5 , 3.5,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(-pi/2,pi/2,Last_X,Last_Y + 10.0,10.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 2)
Tray = plot_arc(0,pi,Last_X - 10.0,Last_Y,10.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 3)
Tray = plot_arc(pi/2,1.5*pi,Last_X,Last_Y - 10.0,10.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 4)
Tray = plot_arc(-pi,0,Last_X + 10.0,Last_Y,10.0, Tray);%Trazo curva a la izquierda
end
%Giro a la derecha
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 3.5,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 3.5,100 - 10 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(3.5 , 2.5,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(pi/2,-pi/2,Last_X,Last_Y - 10.0,10.0, Tray);%Trazo curva a la derecha
end
if(Orient == 2)
Tray = plot_arc(pi,0,Last_X + 10.0,Last_Y,10.0, Tray);%Trazo curva a la derecha
end
if(Orient == 3)
Tray = plot_arc(1.5*pi,pi/2,Last_X,Last_Y + 10.0,10.0, Tray);%Trazo curva a la derecha
end
if(Orient == 4)
Tray = plot_arc(0,-pi,Last_X - 10.0,Last_Y,10.0, Tray);%Trazo curva a la derecha
end
%Giro a la izquierda
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 2.5,10, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 2.5,100 - 10 - 10, Tray);%velocidad de recorrido
Tray = Change_Vel(2.5 , 2.5,10, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);
Last_Y = Tray.y(Tray.ind);
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_arc(-pi/2,0,Last_X,Last_Y + 5.0,5.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 2)
Tray = plot_arc(0,pi/2,Last_X - 5.0,Last_Y,5.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 3)
Tray = plot_arc(pi/2,pi,Last_X,Last_Y - 5.0,5.0, Tray);%Trazo curva a la izquierda
end
if(Orient == 4)
Tray = plot_arc(-pi,-pi/2,Last_X + 5.0,Last_Y,5.0, Tray);%Trazo curva a la izquierda
end
%Tramo rectil?neo
Last_Vel = Tray.v(Tray.ind);
Tray = Change_Vel(Last_Vel , 3.5,30, Tray);%velocidad de recorrido
Tray = Change_Vel(Last_Vel , 3.5,100 - 30 - 30, Tray);%velocidad de recorrido
Tray = Change_Vel(3.5 , 0.01,30, Tray);%velocidad de recorrido
Last_X = Tray.x(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Last_Y = Tray.y(Tray.ind);%Posici?n de ?ltimo punto de la trayectoria
Orient = Get_Orient(Tray);%Orientaci?n  a partir de los 2 ?ltimos puntos
if(Orient == 1)
Tray = plot_line(Last_X,Last_Y,Last_X + 30.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 2)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y + 30.0,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 3)
Tray = plot_line(Last_X,Last_Y,Last_X - 30.0,Last_Y,Tray);%Trazo el tramo de trayectoria
end
if(Orient == 4)
Tray = plot_line(Last_X,Last_Y,Last_X,Last_Y - 30.0,Tray);%Trazo el tramo de trayectoria
end
%Eliminar elementos repetidos. No debe haber 2 puntos consecutivos
%del vector con las mismas coordenadas x, y.
i=2;
barrer = 0;
while (barrer == 0)
if(i ==  length(Tray.x))
barrer = 1;
else
if(Tray.x(i) == Tray.x(i-1))
Tray.x(i)=[];%Igualando a '[]' elimino el elemento
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
display('Funci?n Trayectoria() - Se requieren argumentos')
return;
end
%Compilaci?n exitosa.