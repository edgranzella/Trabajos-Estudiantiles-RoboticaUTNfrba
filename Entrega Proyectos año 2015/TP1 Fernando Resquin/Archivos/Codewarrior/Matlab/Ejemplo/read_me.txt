These files allow the simulation of a differential steered (unicycle-like) mobile robot considering its complete dynamic model. Although not required, the blocks were built to be compatible with Peter Corke's Robotics Toolbox, so  the user can make use of the toolbox functions.

Sets of dynamic parameters are available for the following robots (obtained via identification):

- Pioneer 3DX with Sick LASER sensor;
- Pioneer 3DX without LASER sensor;
- Pioneer 2 without on-board computer (no LASER sensor);
- Pioneer 2 with on-board computer (no LASER sensor);
- Robotic wheelchair carrying a 55kg person;
- Robotic wheelchair carrying a 125kg person;
- Khepera III (identified by Jeffrey Laut).

Four examples are provided:

1. "kinematic_controller_system.slx": implements a simple trajectory tracking controller using both kinematic and dynamic blocks of the differential drive mobile robot.

2. "dynamic_controller_system.slx": implements a more complex system that includes an adaptive dynamic compensation controller and the trajectory tracking controller. The system also has Band-Limited White Noise blocks to add some noise to the measured values of linear velocity, angular velocity and robot position (x,y).

Note: After running "kinematic_controller_system.slx" or "dynamic_controller_system.slx" simulations you can check the results calling the script "plot_results.m".

3. "sl_lanechange_unicycle.slx": implements the same system as the Robotics Toolbox "sl_lanechange", but using the kinematic model of the differential steered mobile robot.

4. "sl_lanechange_unicycle_dynamics.slx": implements the same system as the Robotics Toolbox "sl_lanechange", but using the kinematic and the dynamic models of the differential steered mobile robot.


If you are using Peter Corke's Robotics Toolbox, you might want to copy all files, specially "DiffSteer_model.slx" and "Controllers.slx" to the "...\rvctools\simulink" folder. 

All blocks were tested in MATLAB R2012b (MATLAB Version: 8.0.0.783, Simulink Version 8.0) and R2013a (MATLAB Version: 8.1.0.604, Simulink Version 8.1) running on Windows 7. 

Copy all files to a desired folder. The files include two libraries:

- "DiffSteer_model.slx": Library that contains the kinematic and dynamic blocks of the differential-drive mobile robot.

- "Controllers.slx": Library that contais the following blocks:
    a) trajectory tracking kinematic controller;
    b) dynamic compensation controller 1;
    c) dynamic compensation controller 2;
    d) dynamic parameters estimator (for adaptive controllers);
    e) trajectory generator;
    f) performance calculator (IAE, ITAE, ISE, ITSE and energy indexes).

Enjoy!

Author: Felipe Nascimento Martins
Federal Institute of Education, Science and Technology of Espirito Santo - IFES
NERA - Núcleo de Estudos em Robótica e Automação
http://nera.sr.ifes.edu.br
MAY/2013
Blog sobre robótica: www.nossosrobos.blogspot.com

Based on a prior work by Felipe Nascimento Martins and Wanderley Cardoso Celeste
UFES - Federal University of Espirito Santo, BRAZIL
2006--2008

For detailed information on the system, please refer to the following papers and thesis:

MARTINS, F. N., Celeste, W. C., Carelli, R., Sarcinelli-Filho, M. and 
Bastos-Filho, T. F. An Adaptive Dynamic Controller for Autonomous Mobile Robot
Trajectory Tracking. Control Engineering Practice, v. 16, p. 1354–1363, 2008.
doi: 10.1016/j.conengprac.2008.03.004

MARTINS, F. N., Carelli, R., Sarcinelli-Filho, M. and Bastos-Filho, T. F.
Dynamic Modeling and Adaptive Dynamic Compensation for Unicycle-Like 
Mobile Robots. 14th International Conference on Advanced Robotics -
ICAR 2009, Germany, June, 22-26, 2009.
 
MARTINS, F. N. Modelagem e Compensacao da Dinamica de Robos Moveis e sua 
Aplicacao em Controle de Formacao. Tese de Doutorado em Engenharia Eletrica - Automacao.
Universidade Federal do Espírito Santo, 2009.

LAUT, Jeffrey. A Dynamic Parameter Identification Method for Migrating Control Strategies 
Between Heterogeneous Wheeled Mobile Robots. M.Sc. Diss. Worcester Polytechnic Institute, 2011.