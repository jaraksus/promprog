#!/bin/bash

rm -r build
mkdir build
cd build

cmake -DMAP_FILE=images/map.png -DINPUT_FILE=images/flower.jpg -DOUTPUT_FILE=x.hpp ..
make

cd ..