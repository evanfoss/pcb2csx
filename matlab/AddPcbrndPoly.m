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


points = CalcPcbrndPointsOffset(PCBRND, points);

current = PCBRND.layer_types(PCBRND.layers(layer_number).number);

if (polarity == 0)
   clearmat = LookupPcbrndClearMat(PCBRND, layer_number);
   current.name = clearmat.name;
   priority = PCBRND.void.priority;
else
   priority = PCBRND.layers(layer_number).priority;
end

if (2 == current.subtype)
   CSX = AddPolygon( CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, points, 'CoordSystem', 0);
elseif (3 == current.subtype)
   CSX = AddLinPoly( CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, points, current.thickness, 'CoordSystem',0);
else
   CSX = AddLinPoly( CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, points, current.thickness, 'CoordSystem',0);
end

endfunction

