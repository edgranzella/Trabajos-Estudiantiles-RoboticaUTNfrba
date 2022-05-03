function D = P_Cin_Inv(Vx, Vy, W, q, r, b)
B=[cos(q)/r  sin(q)/r  -b/r ; cos(q)/r sin(q)/r b/r];
D = B*[Vx ; Vy ; W];
    