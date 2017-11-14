function [trace_xy, trace_theta] = CalcPcbrndTraceBodyPriv(trace_x1, trace_y1, trace_x2, trace_y2, trace_radius)
% This function calculates the points for the body of a trace shaped form.
% 
% trace_x1, trace_y1 are the x and y points for the start of the trace
% trace_x2, trace_y2 are the x and y points for the end of the trace
% trace_radius is the width of the trace
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


trace_xdelta = trace_x2 - trace_x1;
trace_ydelta = trace_y2 - trace_y1;

% trace_length = sqrt((trace_xdelta)^2 + (trace_ydelta)^2);

if (0 != trace_xdelta)
   trace_theta = atan((trace_ydelta) / (trace_xdelta));
else
   trace_theta = pi / 2;
end

% now for the polygon to be the body of the trace
trace_xy(1, 1) = trace_x1 - trace_radius * cos(pi/2 - trace_theta);trace_xy(2, 1) = trace_y1 + trace_radius * sin(pi/2 + trace_theta);
trace_xy(1, 2) = trace_x2 - trace_radius * cos(pi/2 - trace_theta);trace_xy(2, 2) = trace_y2 + trace_radius * sin(pi/2 + trace_theta);
trace_xy(1, 3) = trace_x2 + trace_radius * cos(pi/2 - trace_theta);trace_xy(2, 3) = trace_y2 - trace_radius * sin(pi/2 + trace_theta);
trace_xy(1, 4) = trace_x1 + trace_radius * cos(pi/2 - trace_theta);trace_xy(2, 4) = trace_y1 - trace_radius * sin(pi/2 + trace_theta);

endfunction
