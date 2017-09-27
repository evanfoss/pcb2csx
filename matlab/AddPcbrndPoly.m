function CSX = AddPcbrndPoly(CSX, PCBRND, layer_number, points, polarity)
% function's direct inputs
% what layer number is this?
% what points does it have?
%
% indirect inputs via global data structure
% what thickness is this layer?
% is it 2 or 3D? (extrude or not)
% what matterial is this layer?
% what z offset is this layer at?
% 

points = CalcPcbrndPointsOffset(PCBRND, points);

current = PCBRND.layer_types(PCBRND.layers(layer_number).number);

if (polarity == 0)
   clearmat = LookupPcbrndClearMat(PCBRND, layer_number);
   current.name = clearmat.name;
   priority = PCBRND.prio.clearance;
else
   if (3 == current.subtype)
      priority = PCBRND.prio.copperplane;  
   else
      priority = PCBRND.prio.substrate;
   end
end

if (2 == current.subtype)
   CSX = AddPolygon( CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, points, 'CoordSystem', 0);
elseif (3 == current.subtype)
   CSX = AddLinPoly( CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, points, current.thickness, 'CoordSystem',0);
else
   CSX = AddLinPoly( CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, points, current.thickness, 'CoordSystem',0);
end

endfunction

