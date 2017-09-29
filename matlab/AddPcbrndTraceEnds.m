function CSX = AddPcbrndTraceEnds(CSX, PCBRND, current, priority, layer_number, trace_end, trace_theta, trace_radius)
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

segments = PCBRND.kludge.segments;

for counter=1:(segments + 1)
   end_theta = (trace_theta - (pi / 2)) + ( pi * ((counter - 1) / segments ));
   xoffset = (trace_radius) * cos(end_theta);
   yoffset = (trace_radius) * sin(end_theta);
   tracee_xy(1, counter) = trace_end(1, 1) + xoffset;
   tracee_xy(2, counter) = trace_end(2, 1) + yoffset;
end

if (2 == current.subtype)
   CSX = AddPolygon(CSX, current.name, priority, 2, PCBRND.layers(layer_number).zbottom, tracee_xy, 'CoordSystem', 0);
else
   disp('The Trace Ends function is not able to support more than 2D stuff as yet. Sorry');
end

endfunction
