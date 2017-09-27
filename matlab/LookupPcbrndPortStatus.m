function status = RegPcbrndPortStatus(PCBRND, refdes, pad, status)
% status = 1 
% In use
% status = 0
% Not in use

port_number = LookupPcbrndPortNumber(PCBRND, refdes, pad);

status = PCBRND.ports(port_number).status;


endfunction
