function PCBRND = RegPcbrndPad(PCBRND, layer, points, refdes, pin)
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


name.refdes = refdes;
name.pin_number = pin.number;
name.id = pin.id;

points = CalcPcbrndPointsOffset(PCBRND, points);

% if the pad has more or less than 4 corners we are screwed.
if (4 != size(points, 2))
   disp('Error: OpenEMS can not handle pads that are not rectangular. Pad Omission');
   PCBRND = PCBRND;
   return;
end;

% the first entry is tricker to add than the later ones
if (! isfield(PCBRND, 'ports'))
   PCBRND.ports(1).name = name;
   PCBRND.ports(1).points = points;
   PCBRND.ports(1).layer = layer;
   PCBRND.ports(1).status = 0;
   return;
end

% the later entries are simple
PCBRND.ports(size(PCBRND.ports, 2) + 1).name = name;
PCBRND.ports(size(PCBRND.ports, 2) + 1).points = points;
PCBRND.ports(size(PCBRND.ports, 2) + 1).layer = layer;
PCBRND.ports(size(PCBRND.ports, 2) + 1).status = 0;

endfunction
