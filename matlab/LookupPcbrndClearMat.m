function material = LookupPcbrndClearMat(PCBRND, layer_number)
% This function returns the material we are going to clear with for any given layer (layer_number)
% 
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


% the default case is that we are on an outside layer

if (PCBRND.layers(layer_number).clearn > 0)
   material = PCBRND.layer_types(PCBRND.layers(layer_number).clearn);
else
   material = PCBRND.void;
end

endfunction
