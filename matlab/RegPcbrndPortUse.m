function PCBRND = RegPcbrndPortUse(PCBRND, refdes, pad, status)
% status = 1 
% In use
% status = 0
% Not in use

port_number = LookupPcbrndPortNumber(PCBRND, refdes, pad);

PCBRND.ports(port_number).status = status;


endfunction
