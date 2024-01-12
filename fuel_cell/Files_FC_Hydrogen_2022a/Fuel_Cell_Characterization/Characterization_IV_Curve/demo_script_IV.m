%%%% Fuel Cell Parameters
FuelCell.OpenCircuitVoltage = 65;
FuelCell.TafelSlope = 0.23;
FuelCell.InternalResistance = 0.05;
ri = FuelCell.InternalResistance;
FuelCell.NomExchangeCurrent = 120;
FuelCell.CollapseCurrent = 200;
FuelCell.NomH2_Pressure = 1.5e5;
FuelCell.NomAir_Pressure = 1.0e5;
FuelCell.InitVoltage = 10;
FuelCell.Init_Qfuel = 10;
InitVoltage = 50;
FinalVoltage = 25;
Tstart = 30;
Tsim = 360;
Nu = 10;

R = 62.5; Nel=20;
p_vect=linspace(2.5, 5,10);
%x_vect=linspace(0.2, 1, Nel); 
x_vect=linspace(0.2, 0.25, 3); 
r_vect=linspace(0.1, 5, Nel); 
oc_vect=linspace(1.5, 3, Nel); 


for i=1:numel(x_vect)
    
    pH2 = p_vect(1); %% Lowest pressure
    xI = x_vect(i); xR = 1; xOC = 1; %% Medium resistance/Low open-circuit voltage
    label = {'Iadm = 40A','Iadm = 45A','Iadm = 50A'};
            
    sim('Fuel_Cell_IV_Curve.slx');
    tid = simlog.Fuel_Cell.iFC.series.time;
    current = simlog.Fuel_Cell.iFC.series.values;
    voltage = simlog.Fuel_Cell.vFC.series.values;
    temp = simlog.Fuel_Cell.H.T.series.values;
    power = simlog.Power_Sensor.P.series.values;
    
    figure(3);
    voltage = Nu*simlog.Fuel_Cell.E.series.values; 
    current = simlog.Fuel_Cell.iFC.series.values; 
    Kre = voltage./max(current,0);
    eff = simlog.Fuel_Cell.eff_net.series.values;
    
    subplot(1,2,1);
    plot(current,voltage, 'LineWidth', 1.5); hold on; grid on;
    xlabel('Current [A]'); ylabel('V[V]');
    xlim([0 30]); title('Stack Voltage');
    legend(label,'Location','NorthEast');
            
    subplot(1,2,2);
    plot(current, power/1e3, 'LineWidth', 1.5); hold on; grid on;
    xlabel('Current [A]'); ylabel('P[kW]');
    xlim([0 30]); title('Total Stack Power');
    %     plot(current, eff, 'LineWidth', 1.5); hold on; grid on;
    %     xlabel('Current [A]'); ylabel('Efficiency');
    %     xlim([0 30]);  
        
end

