function [points layer_number] = LookupPcbrndPort(PCBRND, refdes, pad)
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



name.refdes = refdes;
name.pin_number = pad.number;
name.id = pad.id;

port_number = 1;

port_number = LookupPcbrndPortNumber(PCBRND, refdes, pad);

points = PCBRND.ports(port_number).points;
layer_number = PCBRND.ports(port_number).layer;

endfunction
