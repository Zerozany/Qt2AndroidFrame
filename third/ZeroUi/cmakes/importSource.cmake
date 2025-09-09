file(GLOB QFILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    "${CMAKE_CURRENT_SOURCE_DIR}/content/*.qml"
    "${CMAKE_CURRENT_SOURCE_DIR}/content/**/*.qml"
)

# 标记 GlobalVar.qml 为单例
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/content/GlobalVar.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(${PROJECT_NAME}
    URI "${PROJECT_NAME}"
    VERSION 1.0
    NO_PLUGIN
    QML_FILES ${QFILES}
    OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${PROJECT_NAME}"
)
