#! /bin/bash

cmake -B build  -G "Ninja" -DANDROID_OPTION=ON 

if [ $? -eq 0 ]; then
    cmake --build build/ -j8
else
    echo "❌ CMake configuration failed !"
    exit 1
fi
