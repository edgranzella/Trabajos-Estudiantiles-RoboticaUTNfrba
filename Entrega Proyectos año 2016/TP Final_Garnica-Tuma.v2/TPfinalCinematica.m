clear all;
clc;  
L=0.133
Rueda=0.03
nl=50 %RPM
nr=50 %RPM
i=1

fid=fopen ('Compilador.txt','r'); %abre el archivo cuyo nombre hemos introducido y está contenido en variable archivo 
tabla=textscan (fid,'%f32 %f32 %f332');
fclose(fid); 

Yfinal=tabla{1}
Xfinal=tabla{2}
Xtramo=tabla{3}

X=[0 0]
Y=[0 0]
i=i+1          
Y(1,i)=Yfinal
X(1,i)=0
i=i+1   
tramos=Xfinal/Xtramo

for j=1:1:tramos/2
%MOVIMIENTO HACIA LA DERECHA
R=-Xtramo/2
nr=nl*(2*R+L)/(2*R-L)
theta=0
 for alfa=pi/2:-pi/10:-pi/2                               
            Iccx=0-R*sin(theta)
            Iccy=0+R*cos(theta)
            M1=[cos(alfa) -sin(alfa) 0;sin(alfa) cos(alfa) 0;0 0 1]
            M2=[0-Iccx;0-Iccy;theta]
            M3=[Iccx;Iccy;alfa]
            M=M1*M2+M3
            X(1,i)=M(1,1)+Xtramo/2+2*(j-1)*Xtramo
            Y(1,i)=M(2,1)+Yfinal+Xtramo/2
            i=i+1 
hold on
grid on          
title('Trayectoria del Robot')
    ylabel('Posicion Y[m]')
    xlabel('Posicion X[m]')
 plot(X,Y,'Color','m')
 axis([-0.5,Xfinal+0.5,-0.5,Yfinal+0.5])
 pause(.001);
 end
  nr=50
  nl=50
  Y(1,i)=Y(1,i-1)-Yfinal
  Yf1=Y(1,i)
  X(1,i)= X(1,i-1)
  i=i+1
%MOVIMIENTO HACIA LA IZQUIERDA
R=Xtramo/2   
nl=nr*(2*R-L)/(2*R+L)
theta=0
for alfa=1.5*pi:pi/10:2.5*pi                               
            Iccx=0-R*sin(theta)
            Iccy=0+R*cos(theta)
            M1=[cos(alfa) -sin(alfa) 0;sin(alfa) cos(alfa) 0;0 0 1]
            M2=[0-Iccx;0-Iccy;theta]
            M3=[Iccx;Iccy;alfa]
            M=M1*M2+M3
            X(1,i)=M(1,1)+2*j*Xtramo-Xtramo/2
            Y(1,i)=M(2,1)-Xtramo/2
            i=i+1
hold on
grid on          
title('Trayectoria del Robot')
    ylabel('Posicion Y[m]')
    xlabel('Posicion X[m]')
 plot(X,Y,'Color','m')
 
 pause(.001);                        

end 
Y(1,i)=Yfinal
X(1,i)=X(1,i-1)
Xi=X(1,i)
i=i+1 
hold on
grid on          
title('Trayectoria del Robot')
    ylabel('Posicion Y[m]')
    xlabel('Posicion X[m]')
 plot(X,Y,'Color','m')
 pause(.001);
 hold off;  
end

           