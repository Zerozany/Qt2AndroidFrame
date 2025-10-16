find_package(spdlog CONFIG REQUIRED)

add_subdirectory("${CMAKE_SOURCE_DIR}/third/SonixBeautyUi")
add_subdirectory("${CMAKE_SOURCE_DIR}/third/WifiConfig")

if(ANDROID)
    add_subdirectory("${CMAKE_SOURCE_DIR}/third/android")
endif()

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    SonixBeautyUiplugin
    WifiConfig
    spdlog::spdlog
    $<$<PLATFORM_ID:Android>:JNIModule>
)
