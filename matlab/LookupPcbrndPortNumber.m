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


port_number = 1;

if (! isfield(PCBRND, 'ports'))
   disp('warning: no ports are registered at this time');
   return;
end

while(port_number < (size(PCBRND.ports,2) + 1))
   current = PCBRND.ports(port_number);
   if (strcmp(current.refdes, refdes) && strcmp(current.number, pad.number) && strcmp(current.id, pad.id) )
      return;
   end
   port_number = port_number + 1;
end

disp('Port in question not found. LookupPcbrndPort returning nothing. Sorry.');

port_number = -1;

endfunction
