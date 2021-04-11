#!/bin/bash

rm -r build/ bin/ lib

mkdir build
cd build

cmake ..
cmake .. -DARM=ON -DTOOLS=/home/jarakcyc/work/promprog/cmake-3/TechProgSimpleLibrary/gcc-linaro-7.5.0-2019.12-i686_arm-linux-gnueabihf \
         -DCMAKE_INSTALL_PREFIX=/home/jarakcyc/work/promprog/cmake-3/install

make
sudo make install

cd ..