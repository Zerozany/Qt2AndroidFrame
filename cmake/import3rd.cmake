add_subdirectory("${CMAKE_SOURCE_DIR}/third/SonixBeautyUi")
add_subdirectory("${CMAKE_SOURCE_DIR}/third/WifiConfig")

if(ANDROID)
    add_subdirectory("${CMAKE_SOURCE_DIR}/third/android")
endif()

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    SonixBeautyUi
    WifiConfig
    $<$<PLATFORM_ID:Android>:JNIModule>
)
