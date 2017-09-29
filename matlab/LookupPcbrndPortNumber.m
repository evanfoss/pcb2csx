function port_number = LookupPcbrndPortNumber(PCBRND, refdes, pad)

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
