add_subdirectory("${CMAKE_SOURCE_DIR}/third/SonixBeautyUi")
add_subdirectory("${CMAKE_SOURCE_DIR}/third/WifiConfig")
add_subdirectory("${CMAKE_SOURCE_DIR}/third/android")

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    SonixBeautyUi
    WifiConfig
    JNIModule
)
