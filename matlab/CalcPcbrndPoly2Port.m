function [start stop] = CalcPcbrndPoly2Port(PCBRND, points, layer_number)
% this function returns two cornerns of the port;
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
