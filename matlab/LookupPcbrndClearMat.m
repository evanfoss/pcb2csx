function material = LookupPcbrndClearMat(PCBRND, layer_number)
% This function returns the material we are going to clear with for any given layer (layer_number)
% 
% 

% the default case is that we are on an outside layer

if (PCBRND.layers(layer_number).clearn > 0)
   material = PCBRND.layer_types(PCBRND.layers(layer_number).clearn);
else
   material = PCBRND.void;
end

endfunction
