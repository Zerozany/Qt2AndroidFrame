add_subdirectory("${CMAKE_SOURCE_DIR}/third/SonixBeautyUi")
add_subdirectory("${CMAKE_SOURCE_DIR}/third/WifiConfig")

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    SonixBeautyUi
    WifiConfig
)
