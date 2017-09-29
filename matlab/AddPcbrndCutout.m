function CSX = AddPcbrndCutout(CSX, PCBRND, points, trace_width)
% This function adds traces of the style used by pcb-rnd and pcb (associated with gEDA)
% CSX is the structure with the geometry being assembled
% substrate is a larger structure that includes the info on the substrate
% 
% trace_x1, trace_y1 are the x and y points for the start of the trace
% trace_x2, trace_y2 are the x and y points for the end of the trace
% trace_radius is the width of the trace
% trace_clear is the clearance of the trace
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

trace_radius = trace_width / 2;
tmp = PCBRND.void;
priority = PCBRND.prio.void;
% a cutout is a 3D construct
tmp.subtype = 3;

tmp.thickness = PCBRND.layers(size(PCBRND.layers, 2)).ztop - PCBRND.layers(1).zbottom;

if (size(points,2) > 1)
   % polygon cuts out the area enclosed by the "traces"
   edge = 1;
   while(edge < size(points,2))
      trace_x1 = points(1, edge);
      trace_y1 = points(2, edge);
      trace_x2 = points(1, (edge + 1));
      trace_y2 = points(2, (edge + 1));
      [trace_xy, trace_theta] = CalcPcbrndTraceBodyPriv(trace_x1, trace_y1, trace_x2, trace_y2, trace_radius);
      CSX = AddLinPoly(CSX, tmp.name, priority, 2, PCBRND.layers(1).zbottom, trace_xy, tmp.thickness, 'CoordSystem',0);
      CSX = AddCylinder(CSX, tmp.name, priority, [trace_x1 trace_y1 PCBRND.layers(1).zbottom], [trace_x1 trace_y1 (PCBRND.layers(size(PCBRND.layers, 2)).ztop)], trace_radius);
      CSX = AddCylinder(CSX, tmp.name, priority, [trace_x2 trace_y2 PCBRND.layers(1).zbottom], [trace_x2 trace_y2 (PCBRND.layers(size(PCBRND.layers, 2)).ztop)], trace_radius);
      edge = edge + 1;
   endwhile
   if (size(points,2) > 2)
      % The inside of more complicated cutouts must be handled.
      CSX = AddLinPoly( CSX, tmp.name, PCBRND.prio.void, 2, PCBRND.layers(1).zbottom, points, tmp.thickness, 'CoordSystem',0);
      % When drawing a cutout of more than one segment we need to finish it by connecting the first segment and the last one.
      edge = 1;
      trace_x1 = points(1, edge);
      trace_y1 = points(2, edge);
      [trace_xy, trace_theta] = CalcPcbrndTraceBodyPriv(trace_x1, trace_y1, trace_x2, trace_y2, trace_radius);
      CSX = AddLinPoly(CSX, tmp.name, priority, 2, PCBRND.layers(1).zbottom, trace_xy, tmp.thickness, 'CoordSystem',0);
   end
else
   % single point is a dot when drawn with a trace.
   CSX = AddCylinder(CSX, tmp.name, priority, [trace_x1 trace_y1 (PCBRND.layers(1).zbottom)], [trace_x1 trace_y1 (PCBRND.layers(size(PCBRND.layers, 2)).ztop)], trace_radius);
end

endfunction
