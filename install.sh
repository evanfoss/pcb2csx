#!/bin/bash

mkdir ~/programs
mkdir ~/programs/pcb2csx
cp -R matlab ~/programs/pcb2csx/
cp -R examples ~/programs/pcb2csx/
cp LICENSE ~/programs/pcb2csx/
echo "addpath('~/programs/pcb2csx/matlab');" >> ~/.octaverc


