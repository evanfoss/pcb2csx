function [PCBRND, points layer_number] = ClaimPcbrndPort(PCBRND, refdes, pad)

name.refdes = refdes;
name.pin_number = pad.number;
name.id = pad.id;

port_number = LookupPcbrndPortNumber(PCBRND, refdes, pad);

if (PCBRND.ports(port_number).status == 0)
   points = PCBRND.ports(port_number).points;
   layer_number = PCBRND.ports(port_number).layer;
   PCBRND.ports(port_number).status = 1;
else
   disp('Error Port is already in use');
end

endfunction
