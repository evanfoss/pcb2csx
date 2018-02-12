v 20130925 2
C 40000 40000 0 0 0 title-C.sym
B 49000 53000 6500 2000 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
A 50000 54000 500 90 180 3 0 0 0 -1 -1
A 54500 54000 500 270 180 3 0 0 0 -1 -1
L 55800 54400 55000 54100 3 0 0 0 -1 -1
L 55800 55300 55500 55000 3 0 0 0 -1 -1
B 41500 53000 6500 2000 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
A 50000 54000 500 270 180 3 0 0 2 100 100
L 50400 54300 51300 55900 3 0 0 0 -1 -1
A 42500 54000 500 90 180 3 0 0 0 -1 -1
A 47000 54000 500 270 180 3 0 0 0 -1 -1
L 42500 54500 47000 54500 3 0 0 0 -1 -1
L 42500 53500 47000 53500 3 0 0 0 -1 -1
L 42200 53600 42600 52700 3 0 0 0 -1 -1
L 46500 52600 46200 53000 3 0 0 0 -1 -1
T 52100 52700 9 10 1 0 0 0 1
Body of the trace replaced with a rectangle
T 55800 54400 9 10 1 0 0 0 1
Ends of the trace replaced with a smaller polygon extruded vertically
T 55800 55300 9 10 1 0 0 0 1
board outline is now a polygon extruded vertically
T 51300 55900 9 10 1 0 0 0 1
annular ring is here but occupies the same space as the body of the trace and it's round end.
T 45500 53900 9 10 1 0 0 0 1
trace
T 42600 52700 9 10 1 0 0 0 1
end of trace
T 46500 52600 9 10 1 0 0 0 1
board outline
T 42300 56300 9 20 1 0 0 0 1
What we have in pcb-rnd.
T 50300 56300 9 20 1 0 0 0 1
What we need in OpenEMS.
L 54500 54500 54500 53500 3 0 0 2 100 100
L 50000 54500 54500 54500 3 0 0 0 -1 -1
L 54500 53500 50000 53500 3 0 0 0 -1 -1
L 50000 54500 50000 53500 3 0 0 2 100 100
T 44500 40300 9 10 1 0 0 0 6
To me the most annoying corner case is the trouble of board outline vs board cutout. 
PCB fabs by default assume the outline of the board is the middle of the lines drawn 
around the layout. Board cutouts are however milled to the exterior edge of the lines 
drawn in the gerber. Since both are done on the outline layer in pcb-rnd we have to 
figure out which is the outline of the board and which is the outline of the cutout 
before converting the geometry.
L 50000 54600 50000 53400 3 0 0 4 100 100
A 54500 54000 600 180 360 3 0 0 4 100 100
L 54500 54500 54500 53500 3 0 0 2 100 100
L 54500 54600 54500 53400 3 0 0 4 100 100
L 54500 53400 50000 53400 3 0 0 4 100 100
L 54500 54600 50000 54600 3 0 0 4 100 100
L 52100 52700 51500 53500 3 0 0 0 -1 -1
A 42500 54000 600 90 180 3 0 0 4 100 100
A 47000 54000 600 270 180 3 0 0 4 100 100
L 47000 53400 42500 53400 3 0 0 4 100 100
L 47000 54600 42500 54600 3 0 0 4 100 100
A 50000 54000 600 180 360 3 0 0 4 100 100
A 54500 54000 500 90 180 3 0 0 2 100 100
L 55000 53700 55800 53500 3 0 0 0 -1 -1
T 52800 55600 9 10 1 0 0 0 1
clearance around the trace's body is just a square sharing 2 of the same edges with the body only wider
L 52800 55600 52100 54600 3 0 0 0 -1 -1
T 55800 53100 9 10 1 0 0 0 3
Clearance around the end of the trace (required if we are in a 
	polygon) is a cylinder of what ever matterial the copper 
	was displacing (air, solder mask, substrate/adheasive).
L 43700 54600 44500 55400 3 0 0 0 -1 -1
T 44500 55400 9 10 1 0 0 0 1
Clearance around the trace
B 47500 47000 2500 2500 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 48500 48500 200 3 0 0 0 -1 -1 1 -1 -1 -1 -1 -1
V 48500 48500 300 3 0 0 1 -1 100 0 -1 -1 -1 -1 -1
A 48500 48500 800 270 360 3 0 0 4 100 100
A 48500 48500 500 90 360 3 0 0 0 -1 -1
T 50100 52000 9 10 1 0 0 0 3
Clearance around the end of the trace (required if we are in a 
	polygon) is a cylinder of what ever matterial the copper 
	was displacing (air, solder mask, substrate/adheasive).
L 49700 53500 50100 52400 3 0 0 0 -1 -1
L 48500 49300 50300 50600 3 0 0 0 -1 -1
L 48900 48800 50300 49100 3 0 0 0 -1 -1
L 50300 48300 48700 48500 3 0 0 0 -1 -1
L 50300 47800 48700 48300 3 0 0 0 -1 -1
T 50300 50200 9 10 1 0 0 0 3
Clearance around the via (required if we are in a polygon) is 
	a cylinder of what ever matterial the copper was 
	displacing (air, solder mask, substrate/adheasive).
T 50300 49100 9 10 1 0 0 0 1
annular ring is here but occupies the same space as the body of the trace and it's round end.
T 50300 48300 9 10 1 0 0 0 1
via hole is now a cylinder of air which ends just at the start of the solder mask layer.
T 50300 47800 9 10 1 0 0 0 1
the vias plating is a cylinder which is at a priority above the substrate.
T 50300 49700 9 10 1 0 0 0 1
board outline is now a polygon extruded vertically
T 47500 50900 9 20 1 0 0 0 1
Vias in OpenEMS
A 42000 48500 500 90 360 3 0 0 0 -1 -1
V 42000 48500 300 3 0 0 1 -1 100 0 -1 -1 -1 -1 -1
V 42000 48500 200 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
L 42200 48400 43800 47800 3 0 0 0 -1 -1
L 42100 48200 43800 47500 3 0 0 0 -1 -1
L 42100 48000 43800 47200 3 0 0 0 -1 -1
L 43800 49700 43500 49500 3 0 0 0 -1 -1
A 42000 48500 800 270 360 3 0 0 4 100 100
L 42000 49300 43800 50100 3 0 0 0 -1 -1
T 43800 47800 9 10 1 0 0 0 1
via hole
T 43800 47500 9 10 1 0 0 0 1
via hole plating
T 43800 47200 9 10 1 0 0 0 1
annular ring (overlapped by end of trace)
T 43800 49700 9 10 1 0 0 0 1
board outline
T 41000 50900 9 20 1 0 0 0 1
What we have in pcb-rnd.
T 43800 50100 9 10 1 0 0 0 1
Clearance around the via
B 41000 47000 2500 2500 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
L 50300 49700 50000 49500 3 0 0 0 -1 -1
L 47700 44600 49200 43800 3 0 0 0 -1 -1
L 47700 43800 48000 43600 3 0 0 0 -1 -1
B 53000 41800 4200 3700 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
L 55300 46000 54300 44100 3 0 0 0 -1 -1
L 57500 43100 57200 43000 3 0 0 0 -1 -1
A 54600 42700 1500 0 90 3 0 0 0 -1 -1
A 54600 42700 500 0 90 3 0 0 0 -1 -1
A 55600 42700 500 180 180 3 0 0 0 -1 -1
A 54600 43700 500 90 180 3 0 0 0 -1 -1
A 54600 43700 500 270 180 3 0 0 2 100 100
L 54600 44200 54600 43200 3 0 0 2 100 100
L 56100 42700 55100 42700 3 0 0 2 100 100
A 55600 42700 500 0 180 3 0 0 2 100 100
L 57500 42600 56000 42400 3 0 0 0 -1 -1
B 48000 41800 4200 3700 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
L 57500 43900 55800 43600 3 0 0 0 -1 -1
A 49700 42700 500 0 90 3 0 0 0 -1 -1
A 49700 43700 500 90 180 3 0 0 0 -1 -1
A 49700 42700 1500 0 90 3 0 0 0 -1 -1
A 50700 42700 500 180 180 3 0 0 0 -1 -1
A 49700 43700 600 90 180 3 0 0 4 100 100
L 47700 45300 49600 44300 3 0 0 0 -1 -1
A 49700 42700 1600 0 90 3 0 0 4 100 100
A 50700 42700 600 180 180 3 0 0 4 100 100
A 49700 42700 400 0 90 3 0 0 4 100 100
A 54600 42700 1600 0 90 3 0 0 4 100 100
A 55600 42700 600 180 360 3 0 0 4 100 100
A 54600 42700 400 0 90 3 0 0 4 100 100
L 56200 42700 55000 42700 3 0 0 4 100 100
L 54600 44300 54600 43100 3 0 0 4 100 100
L 47700 42400 50100 42700 3 0 0 0 -1 -1
L 55900 42200 57500 42300 3 0 0 0 -1 -1
L 56100 43300 57500 43500 3 0 0 0 -1 -1
A 54600 43700 600 180 360 3 0 0 4 100 100
T 50200 43400 9 10 1 0 0 0 1
arc
T 47700 44600 9 10 1 0 0 6 1
annular ring (overlapped by end of trace)
T 47700 43800 9 10 1 0 0 6 1
board outline
T 48000 45700 9 20 1 0 0 0 1
What we have in pcb-rnd.
T 57500 43900 9 10 1 0 0 0 1
Rotational box to form the body of the arc
T 57500 43100 9 10 1 0 0 0 1
board outline
T 53000 45700 9 20 1 0 0 0 1
OpenEMS
T 55300 46000 9 10 1 0 0 0 1
cylinders for the ends of the arc
T 57500 42600 9 10 1 0 0 0 1
cylinder used to add rounded end to the arc
T 47700 45300 9 10 1 0 0 6 1
trace clearance
T 47700 42400 9 10 1 0 0 6 1
outline of trace clearance
T 57500 42300 9 10 1 0 0 0 1
cylinder used to add clearance in plane(s)
T 57500 43500 9 10 1 0 0 0 1
rotated box used to create clearance around arc
T 55200 46300 9 10 1 0 0 0 1
cylinder used to add clearance
L 55200 46300 54200 44200 3 0 0 0 -1 -1
