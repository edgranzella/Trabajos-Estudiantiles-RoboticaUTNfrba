function [ degs ] = IK(P,P0)
    %% Cinemática Inversa - Inverse Kinematics (IK)
    % P: 
    % P0:
    
    % Usa acosd() en vez de atan2(). Para ello, tiene en cuenta el signo de
    % la articulación 'q'.
    
    global l1;
    global l2;
    global l3;
    
    p = P(2) - P0(2);       % Adyacente
    q = P(1) - P0(1);   
    t = sqrt(p^2 + q^2);    % Hipotenusa
    
    if t == 0
        a1 = 0;
    else
        if q >= 0
            a1 = acosd(p/t);
        else
            a1 = -acosd(p/t);
        end
    end
    
    P1 = P0 + l1 * [sind(a1 ); cosd(a1) ; 0];
    
    u = P - P1;
    r = sqrt(u(1)^2 + u(2)^2);
    s = sqrt(u(1)^2 + u(2)^2 + u(3)^2);
    
    v = (l2^2 + s^2 - l3^2) / (2 * l2 * s);
    
    if u(3) < 0
        a2 = acosd(v) - acosd(r/s);
    else
        a2 = acosd(v) + acosd(r/s);
    end
    
    % Aplicando la Ley de los Cosenos
    a3 = 180 - acosd((l2^2 + l3^2 - s^2) / (2 * l2 * l3));
    
    degs = [a1 ; a2 ; a3];  % Vector retornado por IK()
end