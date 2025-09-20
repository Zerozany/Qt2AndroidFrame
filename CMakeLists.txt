cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

option(ANDROID_OPTION "Enable building for Android" OFF)

project(SonixBeautyStudio VERSION 1.0.0 LANGUAGES CXX)

add_subdirectory("${CMAKE_SOURCE_DIR}/third/SonixBeautyUi")
add_subdirectory("${CMAKE_SOURCE_DIR}/third/WifiConfig")

include("${CMAKE_SOURCE_DIR}/cmake/importQt.cmake")
include("${CMAKE_SOURCE_DIR}/cmake/importConfig.cmake")
include("${CMAKE_SOURCE_DIR}/cmake/importSource.cmake")
include("${CMAKE_SOURCE_DIR}/cmake/import3rd.cmake")
