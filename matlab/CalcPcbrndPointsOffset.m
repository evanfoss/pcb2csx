function points = CalcPcbrndPointsOffset(PCBRND, points)

for counter=1:size(points,2)
   points(1, counter) = points(1, counter) + PCBRND.offset.x;
   points(2, counter) = points(2, counter) + PCBRND.offset.y;
end

endfunction

