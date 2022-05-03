function [ legout ] = legIK(P,P0)
    %% Combina FK e IK para dibujar todo en el diagrama

    a = IK(P,P0);    
    legout = leg(a(1),a(2),a(3),P0);
    % Retorna la matriz de FK
end