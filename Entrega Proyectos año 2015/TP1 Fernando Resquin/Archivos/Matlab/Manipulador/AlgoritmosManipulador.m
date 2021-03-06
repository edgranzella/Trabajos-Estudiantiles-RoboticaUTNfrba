clear all;
clc;

%Defino las dimensiones del robot
Ancho= 51;
Alto=28;
Largo=73; 
l1=6;
l2=40;
l3=36;


%Inicializo las variables de posición y orientación de la plataforma
%móvil

%q0: Orientación de la plataforma
%Xg, Yg: Ubicación de la plataforma en el mapa
%Zg = Alto: Altura de la plataforma, donde nace el manipulador

%Igreso de variables por teclado

%orientación de plataforma en el plano (Xg, Yg) 
q0 = input('Ingrese la orientación de la plataforma (-180 a 180) ');
q0 = q0*pi/180;

%Ubicación de la plataforma en el mapa
Xg = input('Coordenada X de la plataforma en cm '); 
Yg = input('Coordenada Y de la plataforma en cm '); 


Zg = Alto; % Altura de la plataforma, donde nace el manipulador


%Calculo la matriz homogénea de transformación que representa
%a la plataforma, para ver sus efectos en el manipulador. La
%orientación es obtenida a partir de algún tipo de sensor 
%o a partir del GPS, determinándola cuando se dezplaza la plataforma

%Transformación de coordenadas entre la refrencia y la plataforma
r = [cos(q0) -sin(q0) 0 ; sin(q0) cos(q0) 0 ; 0 0 1];

f= [0; 0; 0];

Tr = [r f];

f= [0 0 0 1];

Tr = [Tr;f];

Tt = [1 0 0 Xg ; 0 1 0 Yg ; 0 0 1 Zg ; 0 0 0 1];

%Primero roto y luego translado.
Tg = Tt*Tr;

%Creo el robot con la herramiante de Corke

L1 = link([pi/2 0 0 l1]);

L2 = link([0 l2 0 0]);

L3 = link([0 l3 0 0]);

Robot42 = robot({L1, L2, L3}, 'Nuestro Robot42');

%Afecto a la base del robot con la transformación de la plataforma. 
%Primero roto y luego translado.
Robot42.base = Tt*Tr;

%Inicializo las variables necesarias

i=1;

%For anidados que grafican el espacio de trabajo (azul) y
%lo comparan con los puntos que "ve" la cinemática inversa.
for q1= -100*pi/180:20*pi/180:100*pi/180


    for q2= -5*pi/180:10*pi/180:90*pi/180
        
            
            for q3=-40*pi/180:5*pi/180:0
            
                            
                %Ensamblo la matriz homogénea general 
                M_0_A_1 = [cos(q1) 0 sin(q1) 0 ; sin(q1) 0 -cos(q1) 0 ; 0 1 0 l1 ; 0 0 0 1];
                M_1_A_2 = [cos(q2) -sin(q2) 0 l2*cos(q2) ; sin(q2) cos(q2) 0 l2*sin(q2) ; 0 0 1 0 ; 0 0 0 1];
                M_2_A_3 = [cos(q3) -sin(q3) 0 l3*cos(q3) ; sin(q3) cos(q3) 0 l3*sin(q3) ; 0 0 1 0 ; 0 0 0 1];
                M_0_A_3 = M_0_A_1*M_1_A_2*M_2_A_3;
                H = Tg*M_0_A_3;
                p = H*[0 0 0 1]';
                
                %Guardo en un vector el punto correspondiente a la
                %cinemática directa
                X_plot(i) = p(1,1);
                Y_plot(i) = p(2,1);
                Z_plot(i) = p(3,1);
                               
                %Cambio dicho punto del sistema de cordenadas de referencia
                %al de la plataforma. Luego invoco la cinemática inversa.
                Pc=Corregir_XYZ(X_plot(i), Y_plot(i), Z_plot(i), q0, Xg, Yg, Zg);
                [h j k l]=Cinematica_Inv(Pc(1,1) , Pc(2,1), Pc(3,1), l1, l2, l3, 90*pi/180, -5*pi/180);
                
                if (l == 0)%Veo si Cinematica_Inv() da error
                    
                    %Calculo el punto que corresponde a la salida de la cinematica inversa, pero en 
                    %coordenadas de referencia
                    M_0_A_1 = [cos(h) 0 sin(h) 0 ; sin(h) 0 -cos(h) 0 ; 0 1 0 l1 ; 0 0 0 1];
                    M_1_A_2 = [cos(j) -sin(j) 0 l2*cos(j) ; sin(j) cos(j) 0 l2*sin(j) ; 0 0 1 0 ; 0 0 0 1];
                    M_2_A_3 = [cos(k) -sin(k) 0 l3*cos(k) ; sin(k) cos(k) 0 l3*sin(k) ; 0 0 1 0 ; 0 0 0 1];

                    M_0_A_3 = M_0_A_1*M_1_A_2*M_2_A_3;

                    H = Tg*M_0_A_3;
                    p = H* [0 0 0 1]';
                    X1_plot(i) = p(1,1);
                    Y1_plot(i) = p(2,1);
                    Z1_plot(i) = p(3,1);
                    
                else
                    %Si hay error ploteo un punto de referencia.
                    X1_plot(i) = Xg;
                    Y1_plot(i) = Yg;
                    Z1_plot(i) = 0;
                                     
                    %Informo de ese error
                    texto = sprintf('Error: %d q1: %f q2: %f q3: %f',l, q1*180/pi,q2*180/pi,q3*180/pi);
                    disp(texto)
                end 
            i=i+1;%Incremento el contador                  
            end
    
    end

end

%Ploteo los puntos almacenados en los vectores, para la
%cinemática directa
plot3(X_plot, Y_plot, Z_plot,'Marker','o','Color', 'b');
axis square
xlabel('Eje X');
ylabel('Eje Y');
zlabel('Eje Z');

%Ploteo los puntos almacenados en los vectores, para la
%cinemática inversa
grid on;
hold on;
plot3(X1_plot, Y1_plot, Z1_plot,'Marker','x','Color', 'r');

hold off;
%A modo de debug ploteo las coordenadas x, y ,z por separado
figure(2);
plot(X_plot,'Marker','o','Color', 'b'), hold on, plot(X1_plot,'Marker','x','Color', 'r');
figure(3);
plot(Y_plot,'Marker','o','Color', 'b'), hold on, plot(Y1_plot,'Marker','x','Color', 'r');
figure(4);
plot(Z_plot,'Marker','o','Color', 'b'), hold on, plot(Z1_plot,'Marker','x','Color', 'r');
figure(1);
hold on;
pause;
%Grafico el manipulador generado con Corke y hago que su extremo recorra
%parte del espacio de trabajo
plot(Robot42, [0 0 0]);
disp('Haga zoom sobre el manipulador y presione una tecla');
pause;
q1=-80*pi/180;
for q2= -5*pi/180:10*pi/180:90*pi/180
    for q3=-40*pi/180:5*pi/180:0
    plot(Robot42, [q1 q2 q3]);
    pause;
    figure(1);
    end
end
hold off;