%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% MATLAB script for hydrogen transfer simulation (refuelling_model)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Copyright 2016-2021 MathWorks AB

%%% Assumption on H2 behaviour
%%% var_a == 1: Perfect
%%% var_b == 1: Semiperfect
var_a=1;
var_b=1-var_a;

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

%%% System Properties
dpipe = 0.0079;
Lpipe = 0.5;
area_valve = (pi*dpipe^2/4);
roughness = 2e-6;
Tamb = 273.15+10;
alpha = 5;
Cdo = 0.9;
do = 0.001;

alpha_ht = 5;
area_ht = 1;
vol_ht = 1;

%%% Initial conditions
vch_i1 = 1;
pi1_init = 500;
vch_i2 = 1;
pi2_init = 1000;
vch_o = 0.125;
po_init = 70;
Ti_init = 273.15+15;
To_init = 273.15+15;

%%% control parameters
ph2_rate = 100/60;
ph2_th = 400; 
kp = 0.01;
ki = 0.01/1e3;
kp_cool = 1e4;
ki_cool = 1e4;
tf = 1;
Th2_ref = 273.15-40; 

Kv1 = 0.025; Kmin = Kv1/20;
cooling = 1; tc = 1000;
open('refuel_model.slx');

for m=1:4    
    
    Kv2 = Kv1;
    Th2_ref = (273.15+15)-20*m;
    
    tsim = 2000;
    sim('refuel_model.slx');
    qcooling = simlog.Cooling_Source.Q.series.values;
    
    pd = simlog.valve_3.B.p.series.values;
    rho_h2=simlog.Sensor_d.Density.O.series.values;
    theta_h2 = simlog.Vehicle_Tank.T_I.series.values;
    tid = simlog.valve_3.B.p.series.time;
    
    subplot(2,2,1);    
    plot(tid,pd*10, 'LineWidth',2);
    hold on; grid on;
    xlabel('time[sec]');
    ylabel('pressure [bar]');
    if cooling>0
        legend('-5oC','-25oC','-45oC','-65oC','Location','SouthEast');
    else
    end
    
    subplot(2,2,2);    
    plot(tid,rho_h2, 'LineWidth',2);
    hold on; grid on;
    xlabel('time[sec]');
    ylabel('density [kg/m3]');
    
    if cooling>0    
        subplot(2,2,3);    
        plot(tid,qcooling/1e3, 'LineWidth',2);
        hold on; grid on;
        xlabel('time[sec]');
        ylabel('cooling power [kW]');
    else
    end
    
    subplot(2,2,4);    
    plot(tid,theta_h2, 'LineWidth',2);
    hold on; grid on;
    xlabel('time[sec]');
    ylabel('temperature [K]');    
    
end

h=figure(1);
h.WindowStyle = 'docked';