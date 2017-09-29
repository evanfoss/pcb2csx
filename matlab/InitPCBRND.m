function PCBRND = InitPCBRND(layers, layer_types, void, base_priority, offset)
%
% Initializes the basics to add a pcb layout into openems
%
% layer types defines the names of the matterials used for the layers. 
% this must follow the same order as the layer definitions in layers described above.
%
% Copyright (C) 2017 Evan Foss
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
%
% You should have received a copy of the GNU Lesser General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>
%


layers(1).zbottom = offset.z;

for counter=1:size(layers,2)
   if (counter > 1)
      layers(counter).zbottom = layers(counter - 1).ztop;
   end
   if (2 == layer_types(layers(counter).number).subtype)
%      disp('it is conductive!');
      layers(counter).ztop = layers(counter).zbottom;
   elseif (3 == layer_types(layers(counter).number).subtype)
%      disp('it is an insulator!');
      layers(counter).ztop = layers(counter).zbottom + layer_types(layers(counter).number).thickness;
   else
      disp('not yet implimented!');
      layers(counter).ztop = layers(counter).zbottom + layer_types(layers(counter).number).thickness;
   end
end

% how to seperate the matterials
prio.substrate = base_priority;
prio.copperplane = prio.substrate + 1;
prio.clearance = prio.copperplane + 1;
prio.coppertrace = prio.clearance + 1;
prio.void = prio.coppertrace + 1;
%if (mask = 1 or silk = 1)
%   prio.mask = prio.void;
%   prio.void = mask_prio + 1;
%   prio.silk = mask_prio;
%end
PCBRND.layers = layers;
PCBRND.layer_types = layer_types;
PCBRND.void = void;
PCBRND.offset = offset;
PCBRND.prio = prio;

endfunction
