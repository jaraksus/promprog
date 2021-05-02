#!/bin/bash

sudo rm -r build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j9
make coverage_report -j9

cd ..