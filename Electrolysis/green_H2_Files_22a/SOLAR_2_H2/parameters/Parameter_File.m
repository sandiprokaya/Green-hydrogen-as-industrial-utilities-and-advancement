%%% Hydrogen Properties
Hydrogen_Prop_File;

%%% Solar Data
load('solarProfile.mat');

%%% Thermodynamic Energy
TDS = 48.7e3;                         % Entropy Reaction (@298K)
DH = 285.8e3;                         % Enthalpy Water (@298K)
theta0 = 298;                         % Reference Temperature (K) 
dT_setpoint = 8;                      

%%% Stack Properties
Plate.X = 50; %cm
Plate.Y = 100; %cm 
Plate.Z = 100; %cm
Electrolyzer.Np_electrodes = 3; %pair
Electrolyzer.N_cell = 50;
Electrolyzer.Temp_vect = linspace(273.15, 353.15, 5);
Electrolyzer.Efficiency_vect = linspace(0.55,0.9,5);
Electrolyzer.AreaMembrane = (Plate.Y*Plate.Z)*Electrolyzer.Np_electrodes;
Electrolyzer.Xd = 2.0; %cm

%%% Tank Properties
Tank.Area = (Plate.X*Plate.Y)*Electrolyzer.Np_electrodes;
Tank.Volume = Tank.Area*(Plate.Z*1.25);
H2_Tank.Volume = 100*100*100; %cm^3
H2_Tank.T_storage = 273.15;

%%% Electric Properties
Electric.Resistance = 0.25; %Ohm
Heat.Resistance = 25; %Ohm

%%% DC-DC converter Properties
DCDC_converter.I_vect = [0, 400, 1000];
DCDC_converter.eff_vect = [90, 95, 98];
Solar.Area = 25*25; %m^2
Temp_vect_heat = [0 50 75 100]+273.15;
I_vect_heat = [100 75 0 0];

%%% Control Parameters
Control.InitVoltage = 100;
Control.Slope = 750/(10*60);
Control.T_filter = 30;
Control.Vnom = 1000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Parameters used for green_hydrogen_Battery model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

irradiance = 1000;
temperature = 25;
Ts = 10;
Ts_Control = 1;

%%% Battery Data
Battery.Qn = 50000;
Battery.Qinit = 50000;
Battery.Q1 = Battery.Qn*0.5;
Battery.Rs = 0.2;
Battery.Un = 240;
Battery.U1 = 210;

Operation_Ref.Ie = [100 95 75 12.5 12.5]; 
Operation_Ref.Isolar = [0 500 700 750 1000];
Converter.Iout = [40 80 120];
Converter.Efficiency = [95 98 100];

