#!/bin/bash

rm -r build/ bin/ lib

mkdir build
cd build

# cmake ..
cmake .. -DTOOLS=/home/jarakcyc/work/promprog/cmake-3/TechProgSimpleLibrary/gcc-linaro-7.5.0-2019.12-i686_arm-linux-gnueabihf/
make
sudo make install

cd ..