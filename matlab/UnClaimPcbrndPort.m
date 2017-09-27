function [PCBRND, points layer_number] = ClaimPcbrndPort(PCBRND, refdes, pad)

name.refdes = refdes;
name.pin_number = pad.number;
name.id = pad.id;

port_number = LookupPcbrndPortNumber(PCBRND, refdes, pad);

if (PCBRND.ports(port_number).status == 1)
   PCBRND.ports(port_number).status = 0;
else
   disp('Error Port is not in use');
end

endfunction
