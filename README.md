# pcb2csx
This is a collection of matlab/octave scripts used to convert printed circuit board (PCB) geometry to CSXCAD. This is intended for PCB layout not just for the layout tool PCB-RND but for anyone else who feels like supporting it. 

# The problem with polygons
CSXCAD is built using CSG (Constructive Solid Geometry) however a lot of PCB layout software does not use this method for calculating clearance in polygons. This library supports clearance via precutting polygons and using the libraries own cutting solids automatically generated with each object (trace, pad, & etc).

# Installation
For the moment I have created a script install.sh that will add the director ~/programs and add the line directing octave to it in your ~/.octaverc file. If you want to have it land somewhere else for what ever reason feel free to edit this. 

I would prefer octave have somewhere for the libraries to live in each persons home but that is not standardized yet.

# Limitations

* No polygons inside CSG created holes inside polygons. I am working to fix the nested polygon problem.
* No curves/arcs this is a limitation inherited from CSXCAD.
* Trace ends in almost every PCB layout tool ever are round. Currently we let the user define what order polygon to replace them with.
* The terminals (ports) produced are currently only rectangular because they are 1:1 conversions of geometry to CSXCAD port constructs.
* Currently vias are not supported. This is because there is no way to use the 2D representation of copper prefered for simulation speed with the 3D representation required to make a conductive cylinder for the via. I may in time code this feature to work with all copper represented in 3D.

# Plans

* Fix the nested polygon problem (see Limitations)
* Support curves/arcs (see Limitations)
* Set the order of the polygon's used to replace round stuff as a function of mesh density.
* Support for non-rectangular port geometry.

# License
This library is LGPL 2/LGPL 3.0. LGPL2 is my prefrence but LGPL 3.0 is added to match the license used by CSXCAD.

# Development
So far this project is solely mine (Evan Foss) so far. Because it's just me and because of the projects history this github project will be where offical distribution happens but the actual development will continue at svn://repo.hu/pcb-rnd/work/fem/matlab


