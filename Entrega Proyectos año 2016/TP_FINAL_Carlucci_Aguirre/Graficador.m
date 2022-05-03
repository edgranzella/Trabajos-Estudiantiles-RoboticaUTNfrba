%TP Final Robótica 
%Curso: R6055
%Alumnos:   Carlucci Rigoni Tadeo
%           Aguirre Fernando
%Profesor:  Hernan Giannetta
%ATP's:     Eduardo Damian Granzella
%           Lucas Matias Barrera 

clear all;
clc;
syms q1 q2 q3 q4  

l3=3;   %largo del 1er brazo
l4=3;   %largo del 2do brazo


    %Primer matriz: translacion     

        M_0A1 =[1 0 0 0; 0 1 0 0; 0 0 1 q1; 0 0 0 1]; 
        
   
    %Segunda matriz: rotacion Z 90° + rotacion X 90° 
        a=[cosd(-90) -sind(-90) 0 0; sind(-90) cosd(-90) 0 0; 0 0 1 0; 0 0 0 1];
        b=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]; 
        c=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
        d=[1 0 0 0; 0 cosd(-90) -sind(-90) 0; 0 sind(-90) cosd(-90) 0; 0 0 0 1]; 
                
                M_1A2=a*b*c*d
                
    %Tercera matriz: translacion
               
            
               M_2A3=[1 0 0 0; 0 1 0 0; 0 0 1 q2; 0 0 0 1]             
%--------------------------PRIMER BRAZO-------------------------- 

    %Cuarta matriz: rotacion en Z, angulo variable q3 + desplazamiento l3
                
               a=[cos(q3+(pi/2)) -sin(q3+(pi/2)) 0 0; sin(q3+(pi/2)) cos(q3+(pi/2)) 0 0; 0 0 1 0; 0 0 0 1];
               b=[1 0 0 l3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
               
                
                M_3A4=a*b           

    %Quinta matriz: rotacion en Z, angulo variable q4 + desplazamiento l4
                
                
                a=[cos(q4) -sin(q4) 0 0; sin(q4) cos(q4) 0 0; 0 0 1 0; 0 0 0 1];
                b=[1 0 0 l4; 0 1 0 0; 0 0 1 0; 0 0 0 1];
                
                M_4A5=a*b
                
T= M_0A1 * M_1A2 * M_2A3 * M_3A4 * M_4A5;



   %--------------------------SEGUNDO BRAZO-------------------------- 
                
     %Cuarta matriz: rotacion en Z, angulo variable q3 + desplazamiento l3
                
               a=[cos(-q3-(pi/2)) -sin(-q3-(pi/2)) 0 0; sin(-q3-(pi/2)) cos(-q3-(pi/2)) 0 0; 0 0 1 0; 0 0 0 1];
                b=[1 0 0 l3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
                
  
                M_3A4_2=a*b;
                
     %Quinta matriz: desplazamiento l4
                
                
                a=[cos(-q4) -sin(-q4) 0 0; sin(-q4) cos(-q4) 0 0; 0 0 1 0; 0 0 0 1];
                b=[1 0 0 l4; 0 1 0 0; 0 0 1 0; 0 0 0 1];
                
                M_4A5_2=a*b;
                
              T= M_0A1 * M_1A2 * M_2A3 * M_3A4_2 * M_4A5_2;


%lectrura del archivo .txt generado por el codigo del compilador

fd = fopen('valoresq.txt','r');

tline = fgetl(fd);  % Extrae la primera línea que no contiene números
tline = fgetl(fd);

data = 'q=[';
while ischar(tline)
    data = sprintf ('%s %s;',data,tline);
    tline = fgetl(fd);
end

data=sprintf('%s];',data);
eval(data);

fclose(fd);





% Correción de ángulos múltiplos (k + 2*pi)
for j=1:1:size(q,1)
   q(j,3)=angle(exp(i*q(j,3)));
   q(j,4)=angle(exp(i*q(j,4)));     
end    

display('Listado de valores de las articulaciones');
q


%Calculo de los valores del extremo de cada eslabón, para asi poder
%graficarlos todos conjuntamente.

Po=[0 0 0 1]';

for j=1:1:size(q,1)

    q1=q(j,1);
    q2=q(j,2);
    q3=q(j,4)/2;
    q4=q(j,3)*2;


    

    %--------------------------PRIMER BRAZO-------------------------- 
    
    M=M_0A1;
    P(:,1)=Po;
    
    M=eval(M);
    P(:,2)=M*Po;
    
    M=M*M_1A2;
    P(:,3)=M*Po;
    
    M=M*eval(M_2A3);
    P(:,4)=M*Po;
    
    M=M*eval(M_3A4);
    P(:,5)=M*Po;
      
    M=M*eval(M_4A5);
    P(:,6)=M*Po;
    
    %--------------------------SEGUNDO BRAZO--------------------------
    
    M=M_0A1;
    P2(:,1)=Po;
    
    M=eval(M);
    P2(:,2)=M*Po;
    
    M=M*M_1A2;
    P2(:,3)=M*Po;
    
    M=M*eval(M_2A3);
    P2(:,4)=M*Po;
    
    M=M*eval(M_3A4_2);
    P2(:,5)=M*Po;
      
    M=M*eval(M_4A5_2);
    P2(:,6)=M*Po;
    %--------------------------------------------------------------------
    
    figure(3);
    view([30 30 ]);

    xlabel('Eje X');
    ylabel('Eje Y');
    zlabel('Eje Z');
    hold on;
    grid on;
    
    %Grafico 1er brazo
    plot3(P(1,:),P(2,:),P(3,:),'Color','b','Marker','x','LineWidth',2,'MarkerSize',10);
    %Grafico 2do brazo
    plot3(P2(1,:),P2(2,:),P2(3,:),'Color','b','Marker','x','LineWidth',2,'MarkerSize',10);
    %Grafico puntos de origen y del extremo del robot
    plot3(P(1,6),P(2,6),P(3,6),'Color','r','Marker','o','LineWidth',2,'MarkerSize',10);
    plot3(Po(1,1),Po(2,1),Po(3,1),'Color','k','Marker','o','LineWidth',2,'MarkerSize',10);
    
    xyz = sprintf ('Extremo (x,y,z) = ( %1.4f , %1.4f , %1.4f )\n(q1,q2,q3,q4) = ( %1.4f , %1.4f , %1.4f , %1.4f )',P(1,6),P(2,6),P(3,6),q1,q2,q3,q4);
    legend(1,xyz);      
    
    axis equal;
    axis ([-1 15 -5 10 -1 15]);
 
    pause(.01);
    hold off;
    
    if( j < size(q,1) )
        clf;
    end
        
end