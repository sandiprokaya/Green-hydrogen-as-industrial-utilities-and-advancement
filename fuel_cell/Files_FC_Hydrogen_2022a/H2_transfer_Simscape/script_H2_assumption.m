%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% MATLAB script for hydrogen transfer simulation (refuelling_model)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Copyright 2016-2021 MathWorks AB

%%% Initial conditions defined in script_refuel.m

%%% Hydrogen properties (Semiperfect)
T_vect = [-75 -50 -25 0 25 50 75 100]+273.15; %K
h_vect = [2532 2875 3224 3578 3936 4295 4655 5017];%kJ/kg
nu_vect = [6.77 7.34 7.88 8.42 8.94 9.44 9.93 10.41]; %s*uPa
cond_vect = [132.4 146.8 160.5 173.4 185.6 197.5 210.1 222.0]; %mW/kg/K
cp_vect = [13.57 13.87 14.08 14.23 14.33 14.4 14.45 14.47]; %kJ/kg/K

%%% Hydrogen properties (Perfect)
R_h2 = 4.12; %kJ/kg/K
h_h2 = h_vect(5); % kJ/kg;
cp_h2 = cp_vect(5); %kJ/kg/K
nu_h2 = nu_vect(5); %s*uPa
cond_h2 = cond_vect(5); %mW/m/K

Th2_ref = 273.15-65;
warning 'off';

for k=1:2
    
    %%% Assumption on H2 behaviour
    %%% var_a == 1: Perfect
    %%% var_b == 1: Semiperfect
    switch k
        case 1
            var_a=1;
            var_b=0;
        case 2
            var_a=0;
            var_b=1;
    end
    Kv1 = 1; Kmin = 0.05;
    Kv2 = Kv1;   
    tsim = 2000;
    tc = 1000; 
    sim('refuel_model.slx');
    qcooling = simlog.Cooling_Source.Q.series.values;
    
    pd = simlog.valve_3.B.p.series.values;
    rho_h2=simlog.Sensor_d.Density.O.series.values;
    theta_h2 = simlog.Vehicle_Tank.T_I.series.values;
    tid = simlog.valve_3.B.p.series.time;
    
    if cooling>0    
        subplot(1,2,1);    
        plot(tid,qcooling/1e3, 'LineWidth',2);
        hold on; grid on;
        xlabel('time[sec]');
        ylabel('cooling power [kW]');
        xlim([600 1400]);
        legend('Perfect','Semiperfect','Location','NorthWest');
    else
    end
    
    subplot(1,2,2);    
    plot(tid,theta_h2, 'LineWidth',2);
    hold on; grid on;
    xlabel('time[sec]');
    ylabel('temperature [K]');
    xlim([600 1400]);
    legend('Perfect','Semiperfect','Location','NorthEast');

    
end

h=figure(1);
h.WindowStyle = 'docked';

    