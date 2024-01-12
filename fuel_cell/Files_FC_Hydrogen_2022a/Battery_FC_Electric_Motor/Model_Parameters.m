%%% Fuel Cell Parameters
Fuel_Cell.OC_Voltage = 65;
Fuel_Cell.Collapse_Current = 200;
Fuel_Cell.Exchange_Current = 80;
Fuel_Cell.Resistance = 0.05;
Fuel_Cell.Tafel_Slope = 0.23;
Fuel_Cell.pH2_nom = 1.5e5;
Fuel_Cell.pAir_nom = 1.0e5;
Fuel_Cell.Cooling_Area = 1e-4;
Fuel_Cell.Cooling_Alpha = 150;
Fuel_Cell.Cooling_Theta = 293.15;
Fuel_Cell.Theta_Init = 273.15+10; 

%%% Battery Parameters
Battery.Unom = 250;
Battery.U1 = 200;
Battery.Qnom = 500;
Battery.Q1 = 250;
Battery.Resistance = 0.05;
Battery.Uinit = 250;

%%% Electric Motor
Electric_Motor.Speed = (2*pi*50/4)*2;
Electric_Motor.TorqueMax = 300;
Electric_Motor.TorqueMin = -50;
Electric_Motor.Torque = 300;
Electric_Motor.Power = 60; %kW



