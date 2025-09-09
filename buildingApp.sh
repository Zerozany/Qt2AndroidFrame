#!/bin/bash

while getopts "d:t:h" opt; do
    case $opt in
        d) device=$OPTARG ;;
        t) type=$OPTARG ;;
        h) echo "Usage: $0 -d <device> -t <build type>"; exit 0 ;;
        ?) echo "Unknown params"; exit 1 ;;
    esac
done

# 如果 type 为空，则默认 debug
if [ -z "$type" ]; then
    type="d"
fi

# 判断 buildType
if [ "$type" = "r" ]; then
    buildType="Release"
else
    buildType="Debug"
fi

rm -rf build/*

# 根据 device 构建
if [ "$device" = "a" ]; then
    cmake -B build/android -G "Ninja" -DANDROID_OPTION=ON -DCMAKE_BUILD_TYPE=$buildType
    if [ $? -eq 0 ]; then
        cmake --build build/android --config $buildType -j8
    else
        echo "❌ CMake configuration failed!"
        exit 1
    fi
elif [ "$device" = "p" ]; then
    cmake -B build/pc -DCMAKE_BUILD_TYPE=$buildType
    if [ $? -eq 0 ]; then
        cmake --build build/pc --config $buildType -j8
    else
        echo "❌ CMake configuration failed!"
        exit 1
    fi
else
    echo "❌ Unknown device: $device"
    exit 1
fi
