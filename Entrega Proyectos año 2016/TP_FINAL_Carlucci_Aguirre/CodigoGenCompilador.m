
%--------------------------------------------------------------------------
% INIT
%--------------------------------------------------------------------------
clear all;
clc;
syms q1 q2 q3 q4 q5 real
arm_lenght=3;
display('INIT()');
Eq = [ q1; 
     cos(q3)*arm_lenght+sin(q4/2)*arm_lenght;
     q2];
q0=[0 0 1.55 0.033 0]; % Valores de q de la posición inicial
qa=q0;          % qa son los valores de q al finalizar cada instrucción
qmax = [20 15 degtorad(180) degtorad(180)]; % Restricciones
qmin = [0  0 degtorad(-125) degtorad(-70)];
q1=qa(1,1);q2=qa(1,2);q3=qa(1,3);
Pa= eval(Eq)';   % Punto en x,y,z

fd = fopen('valoresq.txt','w');


fprintf(fd,'q1      q2      q3      q4      q5\n');
fprintf(fd,'%2.4f   ',q0);
fprintf(fd,' ;\n ');


%--------------------------------------------------------------------------
% MOVE
%--------------------------------------------------------------------------
display('MOVE( 5.0 , 3.0 , 4.0 , 10 )');
Pxyz=[-0.30,0.6,0]'; % q=[0 2.0956 3.0707 0 0 ]
Pxyz=[5.0 , 3.0 , 4.0]';
px=Pxyz(1,1);
py=Pxyz(2,1);
pz=Pxyz(3,1);
%-----------------------------------------------
q1s = pz;
q2s = px;
if (py > 0.53) & (py <= 5.97) 
    q3s =acos((py/2)/arm_lenght);
    q4s =2*asin((py/2)/arm_lenght);
end
if ( imag(q3s) ~= 0 ) | (imag(q4s) ~= 0 )
    display('Punto inalcanzable. Ubicado fuera del espacio de trabajo')  
else
    qi=[q1s q2s q3s q4s 0];
    if ( qi(1,1:4) <= qmax ) & ( qi(1,1:4) >= qmin )        
        N=10;
        inc_q=(qi-qa)/N;
        for( j=1:1:N )
            q(j,:)= qa + j*inc_q ;    % Interpolación lineal
        end
        for j=1:1:size(q,1)
            for h=1:1:size(q,2)
                fprintf(fd,'%2.3f   ',q(j,h));
            end
                fprintf(fd,' ;\n');
            qa=q(j,:);
        end
    else
        display('Los valores de q están fuera de rango');    
    end
end    
q=zeros(1,5);
qa;

%--------------------------------------------------------------------------
% WAIT
%--------------------------------------------------------------------------
display('WAIT()');
t=10;
for j=1:1:t
    q(j,:)= qa ;    
end
for j=1:1:size(q,1)
    for h=1:1:size(q,2)
        fprintf(fd,'%2.3f   ',q(j,h));
    end
        fprintf(fd,' ;\n');
    qa=q(j,:);
end
qa;

%--------------------------------------------------------------------------
% MOVEREC
%--------------------------------------------------------------------------
display('MOVEREC( 10.0 , 5.5 , 10.0 , 10 )');
Pxyz=[10.0 , 5.5 , 10.0]';
%--------------------------------------------------------------------------
% 		APROXIMACION
%--------------------------------------------------------------------------
px=Pxyz(1,1);
py=Pxyz(2,1)-.5;
pz=Pxyz(3,1);
%-----------------------------------------------
q1s = pz;
q2s = px;
if (py > 0.53) & (py <= 5.97) 
    q3s =acos((py/2)/arm_lenght);
    q4s =2*asin((py/2)/arm_lenght);
end
if ( imag(q3s) ~= 0 ) | (imag(q4s) ~= 0 )
    display('Punto inalcanzable. Ubicado fuera del espacio de trabajo')  
else
    qi=[q1s q2s q3s q4s 0];
    if ( qi(1,1:4) <= qmax ) & ( qi(1,1:4) >= qmin )        
        N=10;
        inc_q=(qi-qa)/N;
        for( j=1:1:N )
            q(j,:)= qa + j*inc_q ;    % Interpolación lineal
        end
        for j=1:1:size(q,1)
            for h=1:1:size(q,2)
                fprintf(fd,'%2.3f   ',q(j,h));
            end
                fprintf(fd,' ;\n');
            qa=q(j,:);
        end
    else
        display('Los valores de q están fuera de rango');    
    end
end    
q=zeros(1,5);
qa;
%--------------------------------------------------------------------------
% 		MOVIMIENTO FINAL
%--------------------------------------------------------------------------
px=Pxyz(1,1);
py=Pxyz(2,1);
pz=Pxyz(3,1);
%-----------------------------------------------
q1s = pz;
q2s = px;
if (py > 0.53) & (py <= 5.97) 
    q3s =acos((py/2)/arm_lenght);
    q4s =2*asin((py/2)/arm_lenght);
end
if ( imag(q3s) ~= 0 ) | (imag(q4s) ~= 0 )
    display('Punto inalcanzable. Ubicado fuera del espacio de trabajo')  
else
    qi=[q1s q2s q3s q4s 0];
    if ( qi(1,1:4) <= qmax ) & ( qi(1,1:4) >= qmin )        
        N=10;
        inc_q=(qi-qa)/N;
        for( j=1:1:N )
            q(j,:)= qa + j*inc_q ;    % Interpolación lineal
        end
        for j=1:1:size(q,1)
            for h=1:1:size(q,2)
                fprintf(fd,'%2.3f   ',q(j,h));
            end
                fprintf(fd,' ;\n');
            qa=q(j,:);
        end
    else
        display('Los valores de q están fuera de rango');    
    end
end    
q=zeros(1,5);
qa;

%--------------------------------------------------------------------------
% WAIT
%--------------------------------------------------------------------------
display('WAIT()');
t=10;
for j=1:1:t
    q(j,:)= qa ;    
end
for j=1:1:size(q,1)
    for h=1:1:size(q,2)
        fprintf(fd,'%2.3f   ',q(j,h));
    end
        fprintf(fd,' ;\n');
    qa=q(j,:);
end
qa;

%--------------------------------------------------------------------------
% MOVQ
%--------------------------------------------------------------------------
display('MOVQ( 8.0 , 9.0 , 1.4 , 0.3 , 10)');
N=10;
qi=[8.0 , 9.0 , 1.4 ,0.3 , 0 ];
if ( qi(1,1:4) <= qmax ) & ( qi(1,1:4) >= qmin )
    inc_q=(qi-qa)/N;
    q=zeros(N,5);
    for j=1:1:N
        q(j,:)= qa + j*inc_q ;    
    end
    for j=1:1:size(q,1)
        for h=1:1:size(q,2)
            fprintf(fd,'%2.3f   ',q(j,h));
        end
            fprintf(fd,' ;\n');
        q1=q(j,1);q2=q(j,2);q3=q(j,3);        
        Pa= eval(Eq)';       
        qa=q(j,:);
    end
else
    display('Los valores de q están fuera de rango');
end
q=zeros(1,5);

%--------------------------------------------------------------------------
% WAIT
%--------------------------------------------------------------------------
display('WAIT()');
t=10;
for j=1:1:t
    q(j,:)= qa ;    
end
for j=1:1:size(q,1)
    for h=1:1:size(q,2)
        fprintf(fd,'%2.3f   ',q(j,h));
    end
        fprintf(fd,' ;\n');
    qa=q(j,:);
end
qa;

%--------------------------------------------------------------------------
% HOME
%--------------------------------------------------------------------------
display('HOME()');
N=20;
qi=q0;
clear('q');
inc_q=(qi-qa)/N;
for j=1:1:N
    q(j,:)= qa + j*inc_q ;    
end
for j=1:1:size(q,1)
    fprintf(fd,'%2.3f   ',q(j,:));
    fprintf(fd,' ;\n');    
    qa=q(j,:);
end
q1=qa(1,1);q2=qa(1,2);q3=qa(1,3);
Pa= eval(Eq)';
qa;	

%--------------------------------------------------------------------------
% END
%--------------------------------------------------------------------------
display('END()');
fclose(fd);
