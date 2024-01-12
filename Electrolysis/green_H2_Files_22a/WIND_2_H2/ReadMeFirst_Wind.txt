This is a set of conceptual models representing electrolysis, 
the conversion of electrical energy and water into hydrogen gas.
In this folder, mechanical energy (wind) is harvested through power electronics, 
converted to electricity and finally used for generation of Hydrogen gas.  

-------------------------------------------------------------------------

Parameters in the model are set to capture a consistent physical behaviour 
but are not related to any specific commercial electrolyzer in particular.

Run Start_Up.m, prior to simulating the model.
This folder contains 4 models:
    Grid_AC_PLL_22a.slx > a Phased Lock Loop (PLL) enables grid connection of the AC-DC rectifier
    Wind_AC_PLL_22a.slx > similar to previous, but the power grid is replaced by a machine
    Wind_AC_PM_Generator.slx > introduces field Oriented Control of the permanent magnet generator
    Wind_DC_Battery_Complete > DC Electrolyzer with DC Generator & Energy Storage (battery)

------------------------------------------------------------------------

The implementation of the electrolyzer (Simscape language) is propietary of the author 
and MathWorks and hence not disclosed in this submission.

MathWorks offers licenses and Consulting services. Under a consulting framework,
collaboration may be established to build a tailored electrolysis unit.  
   
Any feedback is really appreciated.
Best Wishes / Juan Sagarduy  