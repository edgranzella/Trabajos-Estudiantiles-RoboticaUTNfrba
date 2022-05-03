% Plots the simulation results: distance error and trajectory.

% Calculation of distance error for plotting
erro_x = xd - x;
erro_y = yd - y;
erro_dist=sqrt(erro_x.*erro_x+erro_y.*erro_y);

figure
plot(tout,erro_dist);
axis([0 max(tout) 0 1.1*max(erro_dist)]);
grid
legend('Error [m]');
title('Distance Error');
xlabel('time [s]');
ylabel('error [m]');

%close all
figure
plot(xd,yd,'r.',x,y,'b-');
axis([1.1*min(xd) 1.1*max(xd) 1.1*min(yd) 1.1*max(yd)+0.1]);
legend('Reference','Actual');
title('Robot Trajectory');
xlabel('x [m]');
ylabel('y [m]');

