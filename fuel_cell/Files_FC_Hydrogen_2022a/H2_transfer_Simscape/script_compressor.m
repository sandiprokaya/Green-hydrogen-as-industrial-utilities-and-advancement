%%% Assumption on H2 behaviour
%%% var_a == 1: Perfect
%%% var_b == 1: Semiperfect
var_a=0;
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

%%% Physical properties
min_step = 1e-300;
spgr_h2 = 0.0693;
cp = 14200;
k = 1.41;
nu = 1.32e-5;

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
disp = 1e-5;

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
tsim = 2000;
ws = 1500;
pc_max = 500e3;
Th2_ref = 283;
ph2_rate = 100/60;
ph2_th = 400; 
tf = 1;
Kv1 = 0.025;
cooling = 1;

open('compressor_model.slx');
sim('compressor_model.slx');
