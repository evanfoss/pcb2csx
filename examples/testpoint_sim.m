
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

unit = 1.0e-3; % all length in mm

% this stuff is needed top initialize things for csxcad
% the idea is that the user would export from pcb-rnd once and then play 
% with this, port configuration (to change the type of simulation), then 
% optionally also the meshing focus.
f_max = 7e9; % maximum frequency of interest
FDTD = InitFDTD();
FDTD = SetGaussExcite( FDTD, f_max/2, f_max/2 );
BC   = {'PML_8' 'PML_8' 'MUR' 'MUR' 'PEC' 'MUR'};
FDTD = SetBoundaryCond( FDTD, BC );
physical_constants;


% Start of meshing stuff (ignore for now)
CSX = InitCSX();
substrate_thick = 1.6;
substrate_center_z = 2;
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
% End of meshing stuff

run testpoint_geo.m

% copied from http://openems.de/index.php/Tutorial:_Microstrip_Notch_Filter
% this stuff enables the xml export and graphing to work
 Sim_Path = 'tmp';
 Sim_CSX = 'msl.xml';
 [status, message, messageid] = rmdir( Sim_Path, 's' ); % clear previous directory
 [status, message, messageid] = mkdir( Sim_Path ); % create empty simulation folder
 WriteOpenEMS( [Sim_Path '/' Sim_CSX], FDTD, CSX );
 CSXGeomPlot( [Sim_Path '/' Sim_CSX] );
%RunOpenEMS( Sim_Path, Sim_CSX );

