function port_number = LookupPcbrndPortNumber(PCBRND, refdes, pad)

name.refdes = refdes;
name.pin_number = pad.number;
name.id = pad.id;

port_number = 1;

if (! isfield(PCBRND, 'ports'))
   disp('warning: no ports are registered at this time');
   return;
end

while(port_number < (size(PCBRND.ports,2) + 1))
   current = PCBRND.ports(port_number).name;
   if (strcmp(current.refdes, name.refdes) && strcmp(current.pin_number, name.pin_number) && strcmp(current.id, name.id) )
      return;
   end
   entry_num = entry_num + 1;
end

disp('Port in question not found. LookupPcbrndPort returning nothing. Sorry.');

port_number = -1;

endfunction
