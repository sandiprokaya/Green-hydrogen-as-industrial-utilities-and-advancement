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
Electrolyzer.N_cell = 150;
Electrolyzer_Grid.N_cell = Electrolyzer.N_cell*8;
Electrolyzer.Temp_vect = linspace(273.15, 353.15, 5);
Electrolyzer.Efficiency_vect = linspace(0.55,0.9,5);
Electrolyzer.AreaTransfer = (Plate.Y*Plate.Z)*Electrolyzer.Np_electrodes;
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

%%% Battery Data (Solar)
Battery.Qn = 50000;
Battery.Qinit = 50000;
Battery.Q1 = Battery.Qn*0.5;
Battery.Rs = 0.2;
Battery.Un = 240;
Battery.U1 = 210;

%%%% Photovoltaic (Solar)
Operation_Ref.Ie = [100 95 75 12.5 12.5]; 
Operation_Ref.Isolar = [0 500 700 750 1000];
Converter.Iout = [40 80 120];
Converter.Efficiency = [95 98 100];

%%% Battery Data (Wind)
Battery.Wind.Qn = 5000;
Battery.Wind.Qinit = 5000;
Battery.Wind.Q1 = Battery.Wind.Qn*0.5;
Battery.Wind.Rs = 0.01;
Battery.Wind.Un = 200;
Battery.Wind.U1 = 190;

Battery.Wind.SOC_Vect = [1 0.8 0.6 0.3 0]*Battery.Wind.Qn;
Battery.Wind.Vref_Vect = 250+[0 -1 -3 -6 -10];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Parameters used for Wind_Electrolysis_AC model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Setpoint.TimeStep = 60*15;
Setpoint.Energy_vect = [50 100 150]; %kWh
Setpoint.Vref_vect = [250 245 240]; %V
Setpoint.Vmax = 285; %V
Setpoint.Vmin = 242.5; %V
Setpoint.dV = 20; %V

Setpoint.AC.Vrms_vect = [200 300 400 500]; %V
Setpoint.AC.Ie_vect = [75 100 150 225]; %A

Setpoint.AC.Us.Vrms_vect = [0 50 100 150 200]; %V
Setpoint.AC.Us.Ie_vect = [0 125 200 350 500]+100; %A

Setpoint.AC.Fsw = 50*27; %Hz
Setpoint.AC.ts = (1/Setpoint.AC.Fsw)/10; %Hz
Setpoint.Tsim = 60;
Setpoint.ACM.Tsim = 10;
Setpoint.PLL.Tsim = 3.0;
PLL.Tc_Derivative = 1e-4;
PLL.Max_Rate_Freq = 12;


%%% Generator DC
Generator.BackEMF = 0.144; %V/rpm
Generator.Resistance = 0.025; %Ohm
Generator.GearRatio = 1/20; %pu
Generator.Frequency = 50;

%%% Generator AC
Generator.AC.Vnom = 460/sqrt(2); %V
Generator.AC.Nnom = 1500; %rpm
Generator.AC.BackEMF = 0.2168; %V/rpm
Generator.AC.PoleNumber = 6; %rpm
Generator.AC.R = 2; %Ohm
Generator.AC.L = 0.005; %H

Generator.PMSM.psim = 0.25; %Wb
Generator.PMSM.Ld = 1.48e-4; %H
Generator.PMSM.Lq = 1.48e-4; %H
Generator.PMSM.Rs = 0.0048; %Ohm
Generator.PMSM.p = 6; %adim (pole pairs)

%%%% DC-DC Converter
Converter.Wind.Iout = [50 110 160]; %A
Converter.Wind.Efficiency = [94 96 97.5]; % percent  

DCLink.Wind.Capacitance = 3.2; %mF
DCLink.Wind.Uinit = 200; %VF

%%% Rectifier 
Converter.Wind.AC.Pvect = [10, 80, 187, 325, 490]; %W
Converter.Wind.AC.iRMS_vect = [5, 50, 100, 150, 200]; %A
Converter.Wind.AC.vDC_nom = 900; %V



