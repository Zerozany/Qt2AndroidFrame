file(GLOB QFILES RELATIVE ${CMAKE_SOURCE_DIR}
    "${CMAKE_SOURCE_DIR}/view/Main.qml"
)

qt_add_qml_module(${PROJECT_NAME}
    URI "App"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES ${QFILES}
)
