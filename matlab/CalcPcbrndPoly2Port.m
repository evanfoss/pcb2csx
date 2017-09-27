function [start stop] = CalcPcbrndPoly2Port(PCBRND, points, layer_number)
% this function returns two cornerns of the port;

PCBRND.layer_types(PCBRND.layers(layer_number).number).thickness;
PCBRND.layers(layer_number).zbottom;

start = [points(1, 1), points(2, 1), PCBRND.layers(layer_number).zbottom];

current = PCBRND.layer_types(PCBRND.layers(layer_number).number);

if (current.subtype == 2)
   stop = [points(1, 3), points(2, 3), PCBRND.layers(layer_number).ztop];
else
   stop = [points(1, 3), points(2, 3), PCBRND.layers(layer_number).zbottom];
end

endfunction
