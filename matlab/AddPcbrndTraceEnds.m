function CSX = AddPcbrndTraceEnds(CSX, PCBRND, current, priority, layer_number, trace_end, trace_theta, trace_radius)

segments = 10;

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
