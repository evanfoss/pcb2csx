function CSX = InitPcbrndLayers(CSX, PCBRND)
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


layer_types = PCBRND.layer_types;
void = PCBRND.void;

for counter=1:size(layer_types, 2)
%   disp("layer type");
%   disp(layer_types(counter).name);
   if (2 == layer_types(counter).subtype)
%      disp('it is conductive!');
      CSX = AddConductingSheet(CSX, layer_types(counter).name, layer_types(counter).conductivity, layer_types(counter).thickness);
   elseif (3 == layer_types(counter).subtype)
%      disp('it is an insulator!');
      CSX = AddMaterial(CSX, layer_types(counter).name);
      CSX = SetMaterialProperty(CSX, layer_types(counter).name, 'Epsilon', layer_types(counter).epsilon);
   else
      disp('Feature not yet implimented!');
      CSX = AddMaterial(CSX, layer_types(counter).name );
      CSX = SetMaterialProperty(CSX, layer_types(counter).name, 'Epsilon', layer_types(counter).epsilon);
   end
end

CSX = AddMaterial( CSX, void.name );
CSX = SetMaterialProperty( CSX, void.name, 'Epsilon', void.epsilon );

endfunction
