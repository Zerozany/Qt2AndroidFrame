if(WIN32)
    file(GLOB SRCFILES
        ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/Win/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/Win/*.cpp
    )
    target_include_directories(${PROJECT_NAME}
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CMAKE_CURRENT_SOURCE_DIR}/src/Win
    )
elseif(ANDROID)
    file(GLOB SRCFILES
        ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/Android/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/Android/*.cpp
    )
    target_include_directories(${PROJECT_NAME}
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CMAKE_CURRENT_SOURCE_DIR}/src/Android
    )
endif()

target_sources(${PROJECT_NAME}
    PRIVATE
    ${SRCFILES}
)
