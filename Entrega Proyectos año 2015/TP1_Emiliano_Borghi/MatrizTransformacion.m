%%
% Matriz de transformación del robot de: 
% "Analysis of Six-Legged Walking Robots" - Shibendu Shekhar Roy et al.
%%

clear all;
clc;

% Parámetros angulares INICIALES de los servos
q1=0; q2=0; q3=0;

% Parámetros físicos del robot (Longitud de tibia, coxis y fémur)
L1=3.9; L2=6.5; L3=14.2;

% Posición inicial del extremo
P = [ 0 0 0 1]';

%%
% Parámetros de DH
% Pata izquierda:
% Link   Theta    d    a   alpha
%  1     Theta_1  0    L1   90°
%  2     Theta_2  0    L2   0
%  3     Theta_3  0    L3   0
%
% Pata derecha:
% Link   Theta    d    a   alpha
%  1     Theta_1  0    L1   -90°
%  2     Theta_2  0    L2    0
%  3     Theta_3  0    L3    0
%%

% q1: Ángulo de movimiento del COXIS
% q2: Ángulo de movimiento del FÉMUR
% q3: Ángulo de movimiento de la TIBIA

%% Funciones Anónimas

T1 = @(q1) [cos(q1) 0 sin(q1) L1*cos(q1); sin(q1) 0 -cos(q1) L1*sin(q1); 0 1 0 0; 0 0 0 1];
   
T2 = @(q2) [cos(q2) -sin(q2) 0 L2*cos(q2); sin(q2) cos(q2) 0 L2*sin(q2); 0 0 1 0; 0 0 0 1];

T3 = @(q3) [cos(q3) -sin(q3) 0 L3*cos(q3); sin(q3) cos(q3) 0 L3*sin(q3); 0 0 1 0; 0 0 0 1];

%%
figure(1)
title('dq1 y dq2, q3=0')
hold on

x1 = [];x2 = [];x3 = [];
y1 = [];y2 = [];y3 = [];
z1 = [];z2 = [];z3 = [];

for q1=-pi/2:pi/100:pi/2

     P_2 = T1(q1)*T2(0)*T3(0)*P;
 
     if (q1 < -pi/4)
         x3 = [x3;P_2(1)];
        y3 = [y3;P_2(2)];
        z3 = [z3;P_2(3)];
         plot3(x3,y3,z3,'Color','b','LineWidth',2);
     elseif (q1 >= -pi/4 && q1 <=pi/4)
         x1 = [x1;P_2(1)];
        y1 = [y1;P_2(2)];
        z1 = [z1;P_2(3)];
         plot3(x1,y1,z1,'Color','g','LineWidth',2);
     else
         x2 = [x2;P_2(1)];
         y2 = [y2;P_2(2)];
         z2 = [z2;P_2(3)];
         plot3(x2,y2,z2,'Color','b','LineWidth',2);
     end
         
     %pause(0.1);
end

%%
%figure(2)
%title('dq2, q1=q3=0')
%hold on

x1 = [];x2 = [];x3 = [];
y1 = [];y2 = [];y3 = [];
z1 = [];z2 = [];z3 = [];

for q2=-pi/2:pi/100:pi/2
  
     P_2 = T1(0)*T2(q2)*T3(0)*P;
     
     if (q2 < -pi/4)
         x3 = [x3;P_2(1)];
        y3 = [y3;P_2(2)];
        z3 = [z3;P_2(3)];
         plot3(x3,y3,z3,'Color','b','LineWidth',2);
     elseif (q2 >= -pi/4 && q2 <=pi/4)
         x1 = [x1;P_2(1)];
        y1 = [y1;P_2(2)];
        z1 = [z1;P_2(3)];
         plot3(x1,y1,z1,'Color','g','LineWidth',2);
     else
         x2 = [x2;P_2(1)];
         y2 = [y2;P_2(2)];
         z2 = [z2;P_2(3)];
         plot3(x2,y2,z2,'Color','b','LineWidth',2);
     end
end
hold off

%%
figure(3)
hold on
title('dq3, q1=q2=0')

x1 = [];x2 = [];x3 = [];
y1 = [];y2 = [];y3 = [];
z1 = [];z2 = [];z3 = [];

for q3=-3*pi/4:pi/50:pi/2
  
     P_2 = T1(0)*T2(0)*T3(q3)*P;
     
      if (q3 < -pi/2)
         x3 = [x3;P_2(1)];
        y3 = [y3;P_2(2)];
        z3 = [z3;P_2(3)];
         plot(x3,z3,'Color','b','LineWidth',2);
      elseif(q3 >= -pi/2 && q3 <= pi/4)
          print('Aca');
        x1 = [x1;P_2(1)];
        y1 = [y1;P_2(2)];
        z1 = [z1;P_2(3)];
         plot(x1,z1,'Color','g','LineWidth',2);
      else
          x2 = [x2;P_2(1)];
        y2 = [y2;P_2(2)];
        z2 = [z2;P_2(3)];
         plot(x2,z2,'Color','b','LineWidth',2);
      end
end
hold off
%%
%% *******************************************************************
%%

figure(4)
title('dq1 y dq2')

x = [];
y = [];
z = [];

for q2=-pi/4:pi/50:pi/4
    for q1=-pi/4:pi/50:pi/4
        
        P_2 = T1(q1)*T2(q2)*T3(0)*P;
     
        x = [x;P_2(1)];
        y = [y;P_2(2)];
        z = [z;P_2(3)];
  end
end
plot3(x,y,z,'Color','r');

%%
figure(5)
title('dq2 y dq3 simultaneamente');
hold on

x = [];
y = [];
z = [];

for q3=-pi/2:pi/50:pi/4
  for q2=-pi/4:pi/50:pi/4
     P_2 = T1(0)*T2(q2)*T3(q3)*P;
     
     x = [x;P_2(1)];
     y = [y;P_2(2)];
     z = [z;P_2(3)];
  end
end
plot(x,z,'Color','m');
hold off

%% /////////////////////////////////////////////////////////////
figure(6)
title('dq1, dq2 y dq3')

x = [];
y = [];
z = [];

for q3=-pi/4:pi/50:pi/8
    for q2=-pi/8:pi/50:pi/8
        for q1=-pi/8:pi/50:pi/8
            
             P_2 = T1(q1)*T2(q2)*T3(q3)*P;

             x = [x;P_2(1)];
             y = [y;P_2(2)];
             z = [z;P_2(3)];
        end
    end
end
%plot(x,y,'Color','g');
plot3(x,y,z,'Color','g');
stop
figure(7);
plot(x,z);