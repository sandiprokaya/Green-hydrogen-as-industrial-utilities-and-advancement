%%% Analyze the effect of initial pressures (source & destination tanks)
%%% on hydrogen gas flow, pressure and temperature 
%%% when transferred from one tank to the other

1. Open & execute script_init_pressures
   (orifice_model_gas.slx)

-------------------------------------------------------------------------

%%% Analyze the effect of pipe and orifice diameter 
%%% on hydrogen gas flow, pressure and temperature
%%% when transferred from one tank to the other 

2. Open & execute script_pipe_dim
   (orifice_model_gas.slx)
  
-------------------------------------------------------------------------  

%%% simulate this model to find out the cooling power required
%%% to ensure a target hydrogen temperature at the destination tank  

3. Open & execute script_refuel
   (refuelling_model.slx)

-------------------------------------------------------------------------

%%% simulate this model to observe the implications of assuming 
%%% that hydrogen is a perfect or semiperfect gas 
%%% >>> perfect = gas properties (density, viscosity...) are constant
%%% >>> semiperefect = gas properties (density, viscosity....) are temperature-dependent

4. Open & execute script_H2_assumption
   (refuelling_model.slx)


-------------------------------------------------------------------------

%%% simulate this model describing how a compressor (speed control)
%%% fills in a tank with hydrogen at a target temperature (cooling unit) 

5. Open & execute script_compressor
   (compressor_model_gas.slx) >>> observe compressor power & speed
				  and hydrogen density in the Scope block 

-------------------------------------------------------------------------  
  