function D = P_Cin_Dir(Wi, Wd, q , r, b)
A=[(r*cos(q))/2 (r*cos(q))/2 ; (r*sin(q))/2 (r*sin(q))/2 ; -r/(2*b) r/(2*b)];
D = A*[Wi ; Wd];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

    