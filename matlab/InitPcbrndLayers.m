function CSX = InitPcbrndLayers(CSX, PCBRND)
%
% Initializes the basics to add a pcb layout into openems
%
% layer types defines the names of the matterials used for the layers. 
% this must follow the same order as the layer definitions in layers described above.
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
