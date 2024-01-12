%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% MATLAB script for hydrogen transfer simulation (orifice_model_gas)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Copyright 2016-2021 MathWorks AB

%%% Assumption on H2 behaviour
    %%% var_a == 1: Perfect
    %%% var_b == 1: Semiperfect
    var_a=1;
    var_b=0;
    
% %%% System properties
vch_i = 1;
vch_o = 0.125;
Tamb = 273.15+10;
Ti_init = Tamb-40;
To_init = Tamb;
rho = 2500;
mi = vch_i*rho*1/250;
mo = vch_o*rho*1/250;
alpha_ht = 5;
area_ht = 0.5;

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

pi_init = 400;
po_init = 200;
tsim = 30;
warning 'off';


for k=1:3
    
    dpipe= 0.04*k/2;
    do=0.005*k/2;
    
    sim('orifice_model_gas.slx');
    
    tid = simlog.Inlet_Chamber.p_I.series.time;
    mdot = simlog.Outlet_Chamber.mdot_A.series.values;
    qdot = simlog.Outlet_Chamber.Q_H.series.values;
    
    p_inlet = simlog.Inlet_Chamber.p_I.series.values;
    T_inlet = simlog.Inlet_Chamber.T_I.series.values;
    
    p_outlet = simlog.Outlet_Chamber.p_I.series.values;
    T_outlet = simlog.Outlet_Chamber.T_I.series.values;
    
    subplot(2,2,1);
    plot(tid,T_inlet,'LineWidth',2); hold on; grid on;
    title('Influence of pipe diameter on inlet temperature');
    xlabel('time[sec]');
    ylabel('temperature(K)');
    
    subplot(2,2,2);
    plot(tid,T_outlet,'LineWidth',2); hold on; grid on;
    title('Influence of pipe diameter on outlet temperature');
    xlabel('time[sec]');
    ylabel('temperature(K)');
    
    subplot(2,2,3);
    plot(tid,qdot,'LineWidth',2);
    hold on; grid on;    
    title('Influence of pipe diameter on heat transfer');
    xlim([0 tsim/3]);
    xlabel('time[sec]');
    ylabel('Qh(kW)');
        
    subplot(2,2,4);
    plot(tid,mdot,'LineWidth',2); 
    hold on; grid on;
    title('Influence of pipe diameter on gas flow rate');
    xlim([0 tsim/3]);
    xlabel('time[sec]');
    ylabel('mdot(kg/s)');
    legend('2cm','4cm','6cm','Location','NorthEast');
    
end

h=figure(1);
h.WindowStyle = 'docked';

    