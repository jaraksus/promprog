#!/bin/bash

rm -r build/ bin/ lib

mkdir build
cd build

cmake ..
make

cd ..