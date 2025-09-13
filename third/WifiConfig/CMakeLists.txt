cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

project(WifiConfig
    VERSION 1.0.0
    LANGUAGES CXX
)

include("${CMAKE_CURRENT_SOURCE_DIR}/cmakes/importQt.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/cmakes/importConfig.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/cmakes/importSource.cmake")
