file(GLOB SOURCEFILES
    ${CMAKE_SOURCE_DIR}/src/**/*.h
    ${CMAKE_SOURCE_DIR}/src/**/*.cpp
)

target_sources(${PROJECT_NAME}
    PRIVATE
    ${SOURCEFILES}
)

file(GLOB INCLUDEDIR
    ${CMAKE_SOURCE_DIR}/src/*
)

foreach(HEADERDIR ${INCLUDEDIR})
    if(IS_DIRECTORY ${HEADERDIR})
        target_include_directories(${PROJECT_NAME}
            PRIVATE
            ${HEADERDIR}
        )
    endif()
endforeach()

file(GLOB RESOURCES_LIST
    RELATIVE ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/view/resource/*.png
    ${CMAKE_SOURCE_DIR}/view/resource/**/*.png
)

qt_add_resources(${PROJECT_NAME} "Main"
    PREFIX "/"
    FILES
    ${RESOURCES_LIST}
)

file(GLOB QFILES RELATIVE ${CMAKE_SOURCE_DIR}
    "${CMAKE_SOURCE_DIR}/view/**/*.qml"
    "${CMAKE_SOURCE_DIR}/view/*.qml"
)

qt_add_qml_module(${PROJECT_NAME}
    URI "App"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES ${QFILES}
)
