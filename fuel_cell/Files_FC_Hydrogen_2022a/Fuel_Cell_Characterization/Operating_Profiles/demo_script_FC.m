%%%% Fuel Cell Parameters
FuelCell.OpenCircuitVoltage = 65;
FuelCell.TafelSlope = 0.23;
FuelCell.InternalResistance = 0.05;
FuelCell.NomExchangeCurrent = 80;
FuelCell.CollapseCurrent = 200;
FuelCell.NomH2_Pressure = 1.5e5;
FuelCell.NomAir_Pressure = 1.0e5;
FuelCell.InitVoltage = 10;
FuelCell.Init_Qfuel = 2.0;

R = 62.5;
p_vect=linspace(2.5,5,10);

for i=1:numel(p_vect)
    
    pH2 = p_vect(i);
    sim('Fuel_Cell_Demo_Model.slx');
    tid = simlog.Fuel_Cell.iFC.series.time;
    current = simlog.Fuel_Cell.iFC.series.values;
    voltage = simlog.Fuel_Cell.vFC.series.values;
    temp = simlog.Fuel_Cell.H.T.series.values;
    
    subplot(2,2,1);
    plot(tid,current,'LineWidth',1.5); 
    grid on; hold on;
    xlabel('time [sec]'); ylabel('Current [A]')
    
    subplot(2,2,2);
    plot(tid,voltage,'LineWidth',1.5); 
    grid on; hold on;
    xlabel('time [sec]'); ylabel('Voltage [V]')    
    
    subplot(2,2,3);
    plot(tid,(current.*voltage)/1e3,'LineWidth',1.5); 
    grid on; hold on;
    xlabel('time [sec]'); ylabel('Power [kW]')
    
    subplot(2,2,4);
    plot(tid, temp-273.15,'LineWidth',1.5); 
    grid on; hold on;
    xlabel('time [sec]'); ylabel('Theta [degC]')
    
end