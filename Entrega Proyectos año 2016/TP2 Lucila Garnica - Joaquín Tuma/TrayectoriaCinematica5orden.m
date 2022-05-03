L=0.135
Rueda=0.03
vl=25 %RPM
vr=50 %RPM
i=1
R=L*(vr+vl)/(2*(vr-vl))

X1=[0 0]
Y1=[0 0]
X2=[0 0]
Y2=[0 0]

%TRAYECTORIA DE UN CIRCULO CON UN RADIO=0,2025m EN UN t=10seg
theta=0
 for alfa=0:pi/12:2*pi       
            Iccx=0-R*sin(theta)
            Iccy=0+R*cos(theta)
            M1=[cos(alfa) -sin(alfa) 0;sin(alfa) cos(alfa) 0;0 0 1]
            M2=[0-Iccx;0-Iccy;theta]
            M3=[Iccx;Iccy;alfa]
            M=M1*M2+M3
            X1(1,i)=M(1,1)
            Y1(1,i)=M(2,1)
            i=i+1
           plot(X1,Y1,'Color','m')
           title('Trayectoria del Robot')
           ylabel('Posicion Y[m]')
           xlabel('Posicion X[m]')
            grid on
            hold on
    
 end
 %velRpm=( Frec/16)*60

vr=[23.1 23.9 24.3 24.95 25.25 25.51 26.3 26.9 27.03 26.8 26.1 25.8 25.1 24.95 24.45 24.33 23]
 vl=[10.5 11.01 11.33 11.62 11.8 11.9 11.59 11.4 11.18  11.08 11.06 10.93 10.6 10.56 10.4 10.01 10] 
 %TRAYECTORIA DE LOS ENCODERS
theta=0
i=1
 for alfa=0:pi/8:2*pi
     nr=vr(1,i)*60/16
     nl=vl(1,i)*60/16
      R=L*(nr+nl)/(2*(nr-nl))
            Iccx=0-R*sin(theta)
            Iccy=0+R*cos(theta)
            M1=[cos(alfa) -sin(alfa) 0;sin(alfa) cos(alfa) 0;0 0 1]
            M2=[0-Iccx;0-Iccy;theta]
            M3=[Iccx;Iccy;alfa]
            M=M1*M2+M3
            X2(1,i)=M(1,1)
            Y2(1,i)=M(2,1)
            i=i+1
           plot(X2,Y2,'Color','r')
           title('Trayectoria del Robot')
           ylabel('Posicion Y[m]')
           xlabel('Posicion X[m]')
            grid on
            hold on
    
 end