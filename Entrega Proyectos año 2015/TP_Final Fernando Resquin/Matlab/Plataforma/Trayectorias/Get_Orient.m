function P = Get_Orient(Array)
    if(Array.ind > 1)
                Dy = Array.y(Array.ind) - Array.y(Array.ind - 1);
                Dx = Array.x(Array.ind) - Array.x(Array.ind - 1);
                alfa = atan_corregida(Dy,Dx)*180/pi;
                if(alfa > -10 && alfa < 10)
                P = 1;
                elseif(alfa < 100 && alfa > 80)
                P = 2;
                elseif(alfa < -80 && alfa > -100)
                P = 4;
                else
                P = 3;
                end
                
    else
                P = 1;
    end
if ~nargout
    display('Función Get_Orient() - Se requieren argumentos')
    return;
end