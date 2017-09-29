
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


% this is to test the library

% this stuff is needed top initialize things for csxcad
f_max = 7e9;
FDTD = InitFDTD();
FDTD = SetGaussExcite( FDTD, f_max/2, f_max/2 );
BC   = {'PML_8' 'PML_8' 'MUR' 'MUR' 'PEC' 'MUR'};
FDTD = SetBoundaryCond( FDTD, BC );
physical_constants;


% the following comment and unit declaration are from
% https://www.guenael.ca/content/Slot-antennas-for-amateur-radio-bands-EN-Guenael.pdf
% setup the simulation physical_constants;
unit = 1.0e-3; % all length in mm


% oshpark (our current pcb vendor) lists the standard thickness as 1.6mm
substrate_thick = 1.6;
substrate_center_z = 2;

CSX = InitCSX();
MSL_length = 50;
MSL_width = 6;
stub_length = 12;
resolution = c0/(f_max*sqrt(3.66))/unit /50; % resolution of lambda/50
mesh.x = SmoothMeshLines( [0 MSL_width/2+[resolution/3 -resolution/3*2]/4], resolution/4, 1.5 ,0 );
mesh.x = SmoothMeshLines( [-MSL_length -mesh.x mesh.x MSL_length], resolution, 1.5 ,0 );
mesh.y = SmoothMeshLines( [0 MSL_width/2+[-resolution/3 +resolution/3*2]/4], resolution/4 , 1.5 ,0);
mesh.y = SmoothMeshLines( [-15*MSL_width -mesh.y mesh.y 15*MSL_width+stub_length], resolution, 1.5 ,0);
mesh.z = SmoothMeshLines( [linspace(0,substrate_thick,5) 10*substrate_thick], resolution );
CSX = DefineRectGrid( CSX, unit, mesh );

layers(1).number = 1; % this layer is copper it is the bottom
layers(1).name = 'Solder';
layers(1).clearn = 0; % clear 0 means use the void matterial
layers(2).number = 2; % this layer is fr4 it is the core
layers(2).name = 'Substrate';
layers(2).clearn = 0;
layers(3).number = 1; % this layer is copper it is the top
layers(3).name = 'Component';
layers(3).clearn = 2; % clear with layer_type 2 material

% I wanted base_priority and offset for users to play with in the event that they have a chassis for the board to sit in.
% base priority is so that the can decide if the board displaces the model of the chassis or the other way around.
base_priority=0;

% material type 1
layer_types(1).name = 'COPPER'; 
layer_types(1).thickness = 1.03556; 
layer_types(1).subtype = 2; % conductive sheet 2D (for 3D copper enter 1 here [not implimented yet])
layer_types(1).conductivity = 56*10^6; 
% layer_types(1).epsilon;
% layer_types(1).mue;
% layer_types(1).kappa;
% layer_types(1).sigma;

% material type 2
layer_types(2).name = 'FR4'; 
layer_types(2).thickness = 4.524;
layer_types(2).subtype = 3; % insulating layer 3D
layer_types(2).epsilon = 3.66; 
% layer_types(2).conductivity = ??;
layer_types(2).mue = 0; 
layer_types(2).kappa = 0;
layer_types(2).sigma = 0;

void.name = 'AIR';
void.epsilon = 1; % epsilon
void.mue = 1; % mue
% void.kappa = kappa;
% void.sigma = sigma;

offset.x = -50;
offset.y = 50;
offset.z = 0;

kludge.segments = 10;

PCBRND = InitPCBRND(layers, layer_types, void, base_priority, offset, kludge);
CSX = InitPcbrndLayers(CSX, PCBRND);

% square substrate
substrate_xy(1, 1) = 0; substrate_xy(2, 1) = 0;
substrate_xy(1, 2) = 100; substrate_xy(2, 2) = 0;
substrate_xy(1, 3) = 100; substrate_xy(2, 3) = -100;
substrate_xy(1, 4) = 0; substrate_xy(2, 4) = -100;
% layer 2 is the substrate
CSX = AddPcbrndPoly(CSX, PCBRND, 2, substrate_xy, 1);


% triangle cutout in copper plane
poly1_xy(1, 1) = 95;poly1_xy(2, 1) = -37;
poly1_xy(1, 2) = 85;poly1_xy(2, 2) = -47;
poly1_xy(1, 3) = 95;poly1_xy(2, 3) = -47;
% layer 1 is the bottom
CSX = AddPcbrndPoly(CSX, PCBRND, 3, poly1_xy, 0);

% square in copper
poly1_xy(1, 1) = 75;poly1_xy(2, 1) = -25;
poly1_xy(1, 2) = 100;poly1_xy(2, 2) = -25;
poly1_xy(1, 3) = 100;poly1_xy(2, 3) = -50;
poly1_xy(1, 4) = 75;poly1_xy(2, 4) = -50;
% layer 3 is the top
CSX = AddPcbrndPoly(CSX, PCBRND, 3, poly1_xy, 1);


% lets put this on layer 3

%

trace_width = 2;
trace_clear = 1;
points(1, 1) = 20;
points(2, 1) = -75;
points(1, 2) = 20;
points(2, 2) = -50;

points(1, 3) = 10;
points(2, 3) = -90;
points(1, 4) = 10;
points(2, 4) = -80;

%points(1, 5) = 30;
%points(2, 5) = -90;
%points(1, 6) = 40;
%points(2, 6) = -90;

%points(1, 7) = 40;
%points(2, 7) = -80;
%points(1, 8) = 30;
%points(2, 8) = -80;

%points(1, 9) = 10;
%points(2, 9) = -25;
%points(1, 10) = 10;
%points(2, 10) = -50;


CSX = AddPcbrndTraceSet(CSX, PCBRND, 1, points, trace_width, trace_clear);


cutout_points(1, 1) = 40;cutout_points(2, 1) = -15;
cutout_points(1, 2) = 40;cutout_points(2, 2) = -30;
cutout_width = 2.5;

CSX = AddPcbrndCutout(CSX, PCBRND, cutout_points, cutout_width);

cutout_points(1, 1) = 70;cutout_points(2, 1) = -90;
cutout_points(1, 2) = 90;cutout_points(2, 2) = -75;
cutout_points(1, 3) = 70;cutout_points(2, 3) = -80;
cutout_width = 2.5;

CSX = AddPcbrndCutout(CSX, PCBRND, cutout_points, cutout_width);

points(1, 1) = 80; points(2, 1) = -80;
points(1, 2) = 80; points(2, 2) = -85;
points(1, 3) = 85; points(2, 3) = -85;
poings(1, 4) = 85; points(2, 4) = -80;
refdes = 'U5';
pad.number = 'c5';
pad.id = '14';

% layer 5
PCBRND = RegPcbrndPad(PCBRND, 1, points, refdes, pad);

%[points layer_number] = LookupPcbrndPort(PCBRND, refdes, pad);
%[start stop] = CalcPcbrndPoly2Port(PCBRND, points, layer_number);


% copied from http://openems.de/index.php/Tutorial:_Microstrip_Notch_Filter
% this stuff enables the xml export and graphing to work
 Sim_Path = 'tmp';
 Sim_CSX = 'msl.xml';
 [status, message, messageid] = rmdir( Sim_Path, 's' ); % clear previous directory
 [status, message, messageid] = mkdir( Sim_Path ); % create empty simulation folder
 WriteOpenEMS( [Sim_Path '/' Sim_CSX], FDTD, CSX );
 CSXGeomPlot( [Sim_Path '/' Sim_CSX] );
%RunOpenEMS( Sim_Path, Sim_CSX );

