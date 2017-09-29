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
