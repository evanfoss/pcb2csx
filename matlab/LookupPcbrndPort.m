function [points layer_number] = LookupPcbrndPort(PCBRND, refdes, pad)

name.refdes = refdes;
name.pin_number = pad.number;
name.id = pad.id;

entry_num = 1;

port_number = LookupPcbrndPortNumber(PCBRND, refdes, pad);

points = PCBRND.ports(port_number).points;
layer_number = PCBRND.ports(port_number).layer;

endfunction
