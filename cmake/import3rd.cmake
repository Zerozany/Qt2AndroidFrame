
add_subdirectory("${CMAKE_SOURCE_DIR}/third/SonixBeautyUi")
add_subdirectory("${CMAKE_SOURCE_DIR}/third/WifiConfig")
add_subdirectory("${CMAKE_SOURCE_DIR}/third/Logger")

if(ANDROID)
    add_subdirectory("${CMAKE_SOURCE_DIR}/third/android")
endif()

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    SonixBeautyUiplugin
    WifiConfig
    Logger
    $<$<PLATFORM_ID:Android>:JNIModule>
)
