if(ANDROID)
    file(GLOB SRCFILES
        ${CMAKE_CURRENT_SOURCE_DIR}/src/wifi/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/wifi/*.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/src/settings/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/settings/*.cpp
    )
    target_include_directories(${PROJECT_NAME}
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/src/wifi
        ${CMAKE_CURRENT_SOURCE_DIR}/src/settings
    )
endif()

target_sources(${PROJECT_NAME}
    PRIVATE
    ${SRCFILES}
)
