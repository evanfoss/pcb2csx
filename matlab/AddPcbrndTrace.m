function CSX = AddPcbrndTrace(CSX, PCBRND, layer_number, points, trace_width, trace_clear)
% This function adds traces of the style used by pcb-rnd and pcb (associated with gEDA)
% CSX is the structure with the geometry being assembled
% substrate is a larger structure that includes the info on the substrate
% 
% trace_x1, trace_y1 are the x and y points for the start of the trace
% trace_x2, trace_y2 are the x and y points for the end of the trace
% trace_radius is the width of the trace
% trace_clear is the clearance of the trace
%

points = CalcPcbrndPointsOffset(PCBRND, points);

% Sorry I worte this set of functions before I realized it made more sense to use 1 format for everything.
trace_x1 = points(1, 1);
trace_y1 = points(2, 1);
trace_x2 = points(1, 2);
trace_y2 = points(2, 2);

current = PCBRND.layer_types(PCBRND.layers(layer_number).number);

% this function supports both traces with clearance, traces that are just clearance (no copper), and traces that are all copper and no clearance.

if (trace_width > 0)
   trace_radius = trace_width / 2;
   CSX = AddPcbrndTracePriv(CSX, PCBRND, layer_number, trace_x1, trace_y1, trace_x2, trace_y2, trace_radius, current, PCBRND.prio.coppertrace);
end
if (trace_clear > 0)
   tmp2 = LookupPcbrndClearMat(PCBRND, layer_number);
   % What ever dimension we used for the rest of the trace it should also be used for the clearance
   tmp2.subtype = current.subtype;
   trace_radius = trace_radius + trace_clear;
   CSX = AddPcbrndTracePriv(CSX, PCBRND, layer_number, trace_x1, trace_y1, trace_x2, trace_y2, trace_radius, tmp2, PCBRND.prio.clearance);
end

endfunction
