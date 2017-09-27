function CSX = AddPcbrndTraceSet(CSX, PCBRND, layer, points, trace_width, trace_clear)
% This function draws a group of traces at once.
% The idea is to draw say a bus, matched pair, or whole path of one width and clearance.

for count = 1:2:(size(points, 2))
   tmp(1, 1) = points(1, count);
   tmp(2, 1) = points(2, count);
   tmp(1, 2) = points(1, (count+1));
   tmp(2, 2) = points(2, (count+1));
   CSX = AddPcbrndTrace(CSX, PCBRND, layer, tmp, trace_width, trace_clear);
end

endfunction
