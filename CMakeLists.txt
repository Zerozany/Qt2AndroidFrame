cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

option(ANDROID_OPTION "Enable building for Android" OFF)

if(ANDROID_OPTION)
  include("${CMAKE_SOURCE_DIR}/cmakes/importAndroid.cmake")
endif()

project(SonixBeautyStudio VERSION 1.0.0 LANGUAGES CXX)

add_subdirectory("${CMAKE_SOURCE_DIR}/third/SonixBeautyUi")
add_subdirectory("${CMAKE_SOURCE_DIR}/third/WifiConfig")

include("${CMAKE_SOURCE_DIR}/cmakes/importQt.cmake")
include("${CMAKE_SOURCE_DIR}/cmakes/importConfig.cmake")
include("${CMAKE_SOURCE_DIR}/cmakes/importSource.cmake")
include("${CMAKE_SOURCE_DIR}/cmakes/import3rd.cmake")
