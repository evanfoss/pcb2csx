function CSX = AddPcbrndTracePriv(CSX, PCBRND, layer_number, trace_x1, trace_y1, trace_x2, trace_y2, trace_radius, current, priority)
% This function adds traces of the style used by pcb-rnd and pcb (associated with gEDA)
% CSX is the structure with the geometry being assembled
% substrate is a larger structure that includes the info on the substrate
% 
% trace_x1, trace_y1 are the x and y points for the start of the trace
% trace_x2, trace_y2 are the x and y points for the end of the trace
% trace_radius is the width of the trace
% trace_clear is the clearance of the trace
% 
% The trace is 

[trace_xy, trace_theta] = CalcPcbrndTraceBodyPriv(trace_x1, trace_y1, trace_x2, trace_y2, trace_radius);

% 
if ((trace_x1 <= trace_x2 && trace_y1 == trace_y2 ) || (trace_y1 <= trace_y2 && trace_x1 == trace_x2) || (trace_x1 < trace_x2 && trace_y1 < trace_y2) || (trace_x1 < trace_x2 && trace_y1 > trace_y2))
   trace_theta = trace_theta + pi;
end

if (2 == current.subtype)

   trace_end(1, 1) = trace_x1;
   trace_end(2, 1) = trace_y1;
   CSX = AddPcbrndTraceEnds(CSX, PCBRND, current, priority, layer_number, trace_end, trace_theta, trace_radius);
   trace_end(1, 1) = trace_x2;
   trace_end(2, 1) = trace_y2;
   trace_theta = trace_theta + pi;
   CSX = AddPcbrndTraceEnds(CSX, PCBRND, current, priority, layer_number, trace_end, trace_theta, trace_radius);
   CSX = AddPolygon( CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, trace_xy, 'CoordSystem', 0);
elseif (3 == current.subtype)
   disp('You put a trace on subtype 3 which is reserved for substrate. You have been warned.');
   CSX = AddLinPoly( CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, trace_xy, (PCBRND.layers(layer_number).zbottom + current.thickness), 'CoordSystem',0);
else
   CSX = AddLinPoly(CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, trace_xy, current.thickness, 'CoordSystem',0);
   CSX = AddCylinder(CSX, current.name, priority, [trace_x1 trace_y1 (PCBRND.layers(layer_number).zbottom)], [trace_x1 trace_y1 (PCBRND.layers(layer_number).zbottom + current.thickness)], trace_radius);
   CSX = AddCylinder(CSX, current.name, priority, [trace_x2 trace_y2 (PCBRND.layers(layer_number).zbottom)], [trace_x2 trace_y2 (PCBRND.layers(layer_number).zbottom + current.thickness)], trace_radius);
end

