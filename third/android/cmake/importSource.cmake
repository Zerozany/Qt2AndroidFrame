if(ANDROID)
    file(GLOB SRCFILES
        ${CMAKE_CURRENT_SOURCE_DIR}/src/**/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/**/*.cpp
    )

    target_include_directories(${PROJECT_NAME}
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/src/wifi
        ${CMAKE_CURRENT_SOURCE_DIR}/src/settings
    )

    target_sources(${PROJECT_NAME}
        PRIVATE
        ${SRCFILES}
    )
endif()
