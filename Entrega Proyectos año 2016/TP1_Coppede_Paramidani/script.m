clc;
clear;
close all;

L1 = Link('d',5,'a',0,'alpha',0);
L2 = Link('theta',pi/2,'a',0,'alpha',pi/2);
L3 = Link('theta',0,'a',0,'alpha',0,'offset', 5);

bot1 = SerialLink([L1 L2 L3], 'name', 'MyRobot-RPP');

figure;
subplot(121)
plot(bot1,[pi 0 0], 'workspace', [-10 10 -10 10 0 10] )

V=[0; 0; 0; 1];
aux1=[1 0 0 0];
aux2=[0 1 0 0];
aux3=[0 0 1 0];

q1 = pi;
q2 = 0;
q3 = 0;
Qini = [q1 q2 q3];

T1 = [ cos(q1) -cos(L1.alpha)*sin(q1) sin(L1.alpha)*sin(q1) L1.a*cos(q1) ; sin(q1) cos(L1.alpha)*cos(q1) -sin(L1.alpha)*cos(q1) L1.a*sin(q1) ; 0 sin(L1.alpha) cos(L1.alpha) L1.d ; 0 0 0 1];
T2 = [ cos(L2.theta) -cos(L2.alpha)*sin(L2.theta) sin(L2.alpha)*sin(L2.theta) L2.a*cos(L2.theta) ; sin(L2.theta) cos(L2.alpha)*cos(L2.theta) -sin(L2.alpha)*cos(L2.theta) L2.a*sin(L2.theta) ; 0 sin(L2.alpha) cos(L2.alpha) q2 ; 0 0 0 1];
T3 = [ cos(L3.theta) -cos(L3.alpha)*sin(L3.theta) sin(L3.alpha)*sin(L3.theta) L3.a*cos(L3.theta) ; sin(L3.theta) cos(L3.alpha)*cos(L3.theta) -sin(L3.alpha)*cos(L3.theta) L3.a*sin(L3.theta) ; 0 sin(L3.alpha) cos(L3.alpha) q3 ; 0 0 0 1];

T = T1*T2*T3;
AT=T*V;
pos_ini = [aux1*AT aux2*AT aux3*AT];

%Método geométrico de cinemática inversa
pos_fin = [7 -7 9];
Qfin = [ (atan(pos_fin(2)/pos_fin(1))) (pos_fin(3)-pos_ini(3)) (sqrt((pos_fin(1)^2)+(pos_fin(2)^2))-L3.offset) ];

Tfin = bot1.fkine(Qfin);

subplot(122)
plot(bot1,Qfin, 'workspace', [-10 10 -10 10 0 10] )

figure;
TRAJ = jtraj(Qini, Qfin, (0:.05:1));
bot1.plot(TRAJ,'workspace', [-10 10 -10 10 0 10]);

t=1:1:21;
figure;
plot(t,TRAJ)
% figure('Name','Area de trabajo completa');
% title('Area de trabajo completa');
% hold on
% for q1 = 0:0.1:2*pi
%     for q2 = 0:0.1:15
%         for q3 = 0:0.1:10
% 
%             T1 = [ cos(q1) -cos(L1.alpha)*sin(q1) sin(L1.alpha)*sin(q1) L1.a*cos(q1) ; sin(q1) cos(L1.alpha)*cos(q1) -sin(L1.alpha)*cos(q1) L1.a*sin(q1) ; 0 sin(L1.alpha) cos(L1.alpha) L1.d ; 0 0 0 1];
%             T2 = [ cos(L2.theta) -cos(L2.alpha)*sin(L2.theta) sin(L2.alpha)*sin(L2.theta) L2.a*cos(L2.theta) ; sin(L2.theta) cos(L2.alpha)*cos(L2.theta) -sin(L2.alpha)*cos(L2.theta) L2.a*sin(L2.theta) ; 0 sin(L2.alpha) cos(L2.alpha) q2 ; 0 0 0 1];
%             T3 = [ cos(L3.theta) -cos(L3.alpha)*sin(L3.theta) sin(L3.alpha)*sin(L3.theta) L3.a*cos(L3.theta) ; sin(L3.theta) cos(L3.alpha)*cos(L3.theta) -sin(L3.alpha)*cos(L3.theta) L3.a*sin(L3.theta) ; 0 sin(L3.alpha) cos(L3.alpha) q3 ; 0 0 0 1];
% 
%             T = T1*T2*T3;
%             AT=T*V;
%             x=aux1*AT;
%             y=aux2*AT;
%             z=aux3*AT;
%             plot3(x,y,z,'r');
%         end
%     end
% end
% drawnow;
% view([-100,-100,-100])
% %camroll(-157.5)
% hold off

%%NS - RRP robot
LL1 = Link('d',5,'a',0,'alpha',pi/2);
LL2 = Link('d',0,'a',0,'alpha',-pi/2);
LL3 = Link('theta',0,'a',0,'alpha',0,'offset', 5);

bot2 = SerialLink([LL1 LL2 LL3], 'name', 'MyRobot-RRP');

figure;
subplot(121)
plot(bot2,[0 pi/2 0], 'workspace', [-10 10 -10 10 0 10] )

q1 = 0;
q2 = pi/2;
q3 = 0;
Qini = [q1 q2 q3];

T1 = [ cos(q1) -cos(LL1.alpha)*sin(q1) sin(LL1.alpha)*sin(q1) LL1.a*cos(q1) ; sin(q1) cos(LL1.alpha)*cos(q1) -sin(LL1.alpha)*cos(q1) LL1.a*sin(q1) ; 0 sin(LL1.alpha) cos(LL1.alpha) LL1.d ; 0 0 0 1];
T2 = [ cos(q2) -cos(LL2.alpha)*sin(q2) sin(LL2.alpha)*sin(q2) LL2.a*cos(q2) ; sin(q2) cos(LL2.alpha)*cos(q2) -sin(LL2.alpha)*cos(q2) LL2.a*sin(q2) ; 0 sin(LL2.alpha) cos(LL2.alpha) LL2.d ; 0 0 0 1];
T3 = [ cos(LL3.theta) -cos(LL3.alpha)*sin(LL3.theta) sin(LL3.alpha)*sin(LL3.theta) LL3.a*cos(LL3.theta) ; sin(LL3.theta) cos(LL3.alpha)*cos(LL3.theta) -sin(LL3.alpha)*cos(LL3.theta) LL3.a*sin(LL3.theta) ; 0 sin(LL3.alpha) cos(LL3.alpha) q3 ; 0 0 0 1];

T = T1*T2*T3;
AT=T*V;
pos_ini = [aux1*AT aux2*AT aux3*AT];

%Método geométrico de cinemática inversa
pos_fin = [7 -7 9];
deltaZ = pos_fin(3)-pos_ini(3);
aux = sqrt((pos_fin(1)^2)+(pos_fin(2)^2));
Qfin = [ (atan(pos_fin(2)/pos_fin(1))) (atan(deltaZ/aux))-Qini(2) (sqrt((aux^2)+(deltaZ^2)))-LL3.offset ];

subplot(122)
plot(bot2,Qfin, 'workspace', [-10 10 -10 10 0 10] )

figure;
TRAJ = jtraj(Qini, Qfin, (0:.05:1));
bot2.plot(TRAJ,'workspace', [-10 10 -10 10 0 10]);

figure;
plot(t,TRAJ)

% figure('Name','Area de trabajo completa');
% title('Area de trabajo completa');
% hold on
% for q1 = 0:0.1:2*pi
%     for q2 = pi/2:0.1:3*pi/2
%         for q3 = 0:0.1:10
% 
%             T1 = [ cos(q1) -cos(LL1.alpha)*sin(q1) sin(LL1.alpha)*sin(q1) LL1.a*cos(q1) ; sin(q1) cos(LL1.alpha)*cos(q1) -sin(LL1.alpha)*cos(q1) LL1.a*sin(q1) ; 0 sin(LL1.alpha) cos(LL1.alpha) LL1.d ; 0 0 0 1];
%             T2 = [ cos(q2) -cos(LL2.alpha)*sin(q2) sin(LL2.alpha)*sin(q2) LL2.a*cos(q2) ; sin(q2) cos(LL2.alpha)*cos(q2) -sin(LL2.alpha)*cos(q2) LL2.a*sin(q2) ; 0 sin(LL2.alpha) cos(LL2.alpha) LL2.d ; 0 0 0 1];
%             T3 = [ cos(LL3.theta) -cos(LL3.alpha)*sin(LL3.theta) sin(LL3.alpha)*sin(LL3.theta) LL3.a*cos(LL3.theta) ; sin(LL3.theta) cos(LL3.alpha)*cos(LL3.theta) -sin(LL3.alpha)*cos(LL3.theta) LL3.a*sin(LL3.theta) ; 0 sin(LL3.alpha) cos(LL3.alpha) q3 ; 0 0 0 1];
% 
%             T = T1*T2*T3;
%             AT=T*V;
%             x=aux1*AT;
%             y=aux2*AT;
%             z=aux3*AT;
%             plot3(x,y,z,'r');
%         end
%     end
% end
% drawnow;
% view([-100,-100,-100])
% %camroll(-157.5)
% hold off