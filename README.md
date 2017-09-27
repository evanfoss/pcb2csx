# pcb2csx
This is a collection of matlab/octave scripts used to convert printed circuit board (PCB) geometry to CSXCAD.

# Specifics
This is intended for PCB layout not just for the layout tool PCB-RND but for anyone else who feels like supporting it.

# The problem with polygons
CSXCAD is built using CSG (Constructive Solid Geometry) however a lot of PCB layout software does not use this method for calculating clearance in polygons. This library supports clearance via precutting polygons and using the libraries own cutting solids automatically generated with each object (trace, pad, & etc).

# Installation
At the moment I have no real installation system just copy this code to a sensible location and add the following line to your startup.m (matlab) or .octaverc (octave).
addpath('~/opt/openEMS/share/pcb2csx/matlab');
Alternatively you could just copy it to the same directory CSXCAD placed it's matlab files in which you should already have done an addpath for.

# License
This project is LGPL 2.1 but I will probably change that later to LGPL 3.0 to match the license used by CSXCAD.



