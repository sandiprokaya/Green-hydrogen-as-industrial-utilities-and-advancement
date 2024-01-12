classdef assumption < int32
   enumeration
     constant (0)
     dynamic (1)
   end
   methods(Static)
       function map = displayText()
         map = containers.Map;
         map('constant') = 'Constant pH';
         map('dynamic') = 'Dynamic pH';
       end
   end
end