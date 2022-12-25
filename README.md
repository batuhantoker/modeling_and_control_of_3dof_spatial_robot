# modeling_and_control_of_3dof_spatial_robot
MATLAB implementation of kinematic analysis and several control approaches on 3 degrees of freedom(DoF) spatial robot


<img width="576" alt="Screen Shot 2022-12-24 at 14 06 08" src="https://user-images.githubusercontent.com/55883119/209437633-e039ac37-953b-4c20-8757-a5209711aa9c.png">


This code consist of following codes. You can find codes and a dedicated report for the reports from code. Note that, the controllers implied in physical robot with identified characteristics using Simulink Real Time controller.
This project can be used to implement any kind or robot by changing parameters in the provided functions.

- Denavit Hartenberg Parameters
- Forward and Inverse Kinematics
- Simulation
- Singularities and Manipulability
- Maximum force exerted by the end-effector for given torque values at each link
- Controls
  (PD + PD gravity,
  PID + PID gravity,
  Inverse dynamics motion controller in joint and task space,
  Passivity based controller.)
  Computed Torque Task and Joint space controller.
- Derivation of Equation of Motion
  Handwritten
  via matlab
