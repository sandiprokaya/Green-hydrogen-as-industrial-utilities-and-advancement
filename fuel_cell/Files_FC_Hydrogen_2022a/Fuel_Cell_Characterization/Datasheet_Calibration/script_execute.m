Tsim = 360;
Tstart = 10;

%%% Reference I-V (data sheet)
I_array = [0 40 80 120 160 200 230];
V_array = [46.6 38.7 36.6 34.7 32.7 31.0 29.5];
P_array = [ 0.0 1.5 2.9 4.2 5.2 6.2 6.8];
Ie_array = [0 7.5 25 40 80 120 160 200 230]; %completed
Ve_array = [46.6 43.5 39.5 38.7 36.6 34.7 32.7 31.0 29.5];%completed

%%%% Fuel Cell Parameters
FuelCell.OpenCircuitVoltage = max(V_array);
FuelCell.TafelSlope = 0.23;
FuelCell.InternalResistance = 0.25e-3;
ri = FuelCell.InternalResistance;
Nu = 1;

%%% Full Parallel Stack
Ns = 48; pAir = 1.05; pH2 = 2.55;

FuelCell.ExchangeCurrent = 50;
FuelCell.CollapseCurrent = 75;
FuelCell.NomH2_Pressure = 1.5e5;
FuelCell.NomAir_Pressure = 1.0e5;
FuelCell.InitVoltage = 0.5;
FuelCell.Init_Qfuel = 1.0;
FuelCell.Max_Qfuel = 77;
FuelCell.Min_Qfuel = 36;
FuelCell.Max_Qair = 366;
FuelCell.xAir = FuelCell.Max_Qair/FuelCell.Max_Qfuel;
FuelCell.Concentration = [99 21 0]; %[H2 O2 vapor]

qh2_supply = linspace(0, FuelCell.Max_Qfuel-FuelCell.Min_Qfuel, 5);
ph2_supply = pH2*ones(numel(qh2_supply),1);%bar

%%% Number of elementary cells
Ncell = 100;

%%% Simulate the Model
sim('Fuel_Cell_IV_Characteristic.slx');
tid = simlog.Fuel_Cell.iFC.series.time;
temp = simlog.Fuel_Cell.H.T.series.values;
power = simlog.Power_Sensor.P.series.values;
IT = simlog.Current_Sensor.I.series.values;
%%% Create plots
figure(3);
voltage = Nu*simlog.Fuel_Cell.E.series.values; 
current = simlog.Fuel_Cell.iFC.series.values; 
Kre = voltage./max(current,0);
eff = simlog.Fuel_Cell.eff_net.series.values;
    
subplot(1,2,1);
plot(IT, voltage, 'LineWidth', 1.5); hold on; grid on;
plot(Ie_array, Ve_array, 'LineWidth', 1.5);
xlabel('Current [A]'); ylabel('V[V]');
title('Stack Voltage');
            
subplot(1,2,2);
plot(IT, power/1e3, 'LineWidth', 1.5); hold on; grid on;
xlabel('Current [A]'); ylabel('P[kW]');
xlim([0 230]); title('Total Stack Power');

%%% Calculate Error between Reference and Simulated
for k=1:numel(voltage)
    vx = interp1(Ie_array, Ve_array, IT(k));
    vf(k) = vx;
    error(k) = 100*(vf(k)-voltage(k))/vf(k);    
end

%%¤ Create Plot
figure(4)
TF = isnan(error); error(TF)=0; 
plot(IT, error, 'LineWidth', 1.5);
ylim([-5 5]);
hold on; grid on;
xlabel('Current [A]'); ylabel('Error [%]');
clear all;
