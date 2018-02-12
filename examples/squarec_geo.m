
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


% Define some layers
layers(1).number = 1; % this layer is copper it is the bottom
layers(1).name = 'Solder';
layers(1).clearn = 0; % clear 0 means use the void matterial
layers(2).number = 2; % this layer is fr4 it is the core
layers(2).name = 'Substrate';
layers(2).clearn = 0;

% I wanted base_priority and offset for users to play with in the event that they have a chassis for the board to sit in.
% base priority is so that the can decide if the board displaces the model of the chassis or the other way around.
base_priority=0;

% Define some materials
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
layer_types(2).thickness = 4.524; % technically this should be substrate_thick but at that thickness it's just too hard to look at in csxcad.
layer_types(2).subtype = 3; % insulating layer 3D
layer_types(2).epsilon = 3.66; 
% layer_types(2).conductivity = ??;
layer_types(2).mue = 0; 
layer_types(2).kappa = 0;
layer_types(2).sigma = 0;

% void is the material used to create voids in stuff. (fill holes, cutouts in substrate, etc)
void.name = 'AIR';
void.epsilon = 1; % epsilon
void.mue = 1; % mue
% void.kappa = kappa;
% void.sigma = sigma;

% Is there an offset we would like to put on the whole layout to locate it relative to the origin point?
offset.x = -20;
offset.y = 20;
offset.z = 0;

% This sets how many points should be used to describe the round end of traces.
kludge.segments = 10;

% Initialize pcb2csx
PCBRND = InitPCBRND(layers, layer_types, void, base_priority, offset, kludge);
CSX = InitPcbrndLayers(CSX, PCBRND);

% square substrate 100mm x 100mm
substrate_xy(1, 1) = 0; substrate_xy(2, 1) = 0;
substrate_xy(1, 2) = 40; substrate_xy(2, 2) = 0;
substrate_xy(1, 3) = 40; substrate_xy(2, 3) = -40;
substrate_xy(1, 4) = 0; substrate_xy(2, 4) = -40;
% layer 2 is the substrate
%CSX = AddPcbrndPoly(CSX, PCBRND, layer, locations, add/sub)
CSX = AddPcbrndPoly(CSX, PCBRND, 2, substrate_xy, 1);

% triangle cutout in copper plane
% notice you can define the cutout in the copper before or after the thing it is in.
poly1_xy(1, 1) = 15;poly1_xy(2, 1) = -15;
poly1_xy(1, 2) = 15;poly1_xy(2, 2) = -25;
poly1_xy(1, 3) = 25;poly1_xy(2, 3) = -25;
poly1_xy(1, 4) = 25;poly1_xy(2, 4) = -15;
% layer 1 is the bottom
CSX = AddPcbrndPoly(CSX, PCBRND, 1, poly1_xy, 0);

% square in copper
poly1_xy(1, 1) = 10;poly1_xy(2, 1) = -10;
poly1_xy(1, 2) = 30;poly1_xy(2, 2) = -10;
poly1_xy(1, 3) = 30;poly1_xy(2, 3) = -30;
poly1_xy(1, 4) = 10;poly1_xy(2, 4) = -30;
% layer 1 is the solder side (bottom)
CSX = AddPcbrndPoly(CSX, PCBRND, 1, poly1_xy, 1);


