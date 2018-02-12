function PCBRND = RegPcbrndPad(PCBRND, layer, points, refdes, pad)
%
% This takes the geometry of a pad, it's unique identification, and registers 
% it in the PCBRND data structure.
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

% if the pad has more or less than 4 corners we are screwed.
if (4 != size(points, 2))
   disp('Error: OpenEMS can not handle pads that are not rectangular. Pad Omission');
   PCBRND = PCBRND;
   return;
end;

% the first entry is tricker to add than the later ones
if (! isfield(PCBRND, 'ports'))
   port_number = 1;
else
   port_number = size(PCBRND.ports, 2) + 1;
end;

% the later entries are simple
PCBRND.ports(port_number).number = pad.number;
PCBRND.ports(port_number).id = pad.id;
PCBRND.ports(port_number).refdes = refdes;
PCBRND.ports(port_number).points = points;
PCBRND.ports(port_number).layer = layer;
PCBRND.ports(port_number).status = 0;

endfunction
