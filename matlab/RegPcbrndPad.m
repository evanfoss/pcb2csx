function PCBRND = RegPcbrndPad(PCBRND, layer, points, refdes, pin)

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
