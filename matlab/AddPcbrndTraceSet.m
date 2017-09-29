function CSX = AddPcbrndTraceSet(CSX, PCBRND, layer, points, trace_width, trace_clear)
% This function draws a group of traces at once.
% The idea is to draw say a bus, matched pair, or whole path of one width and clearance.
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


for count = 1:2:(size(points, 2))
   tmp(1, 1) = points(1, count);
   tmp(2, 1) = points(2, count);
   tmp(1, 2) = points(1, (count+1));
   tmp(2, 2) = points(2, (count+1));
   CSX = AddPcbrndTrace(CSX, PCBRND, layer, tmp, trace_width, trace_clear);
end

endfunction
