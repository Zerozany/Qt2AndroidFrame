target_compile_features(${PROJECT_NAME}
    PRIVATE
    cxx_std_23
)

# 统一定义应用名和版本号
set(APP_NAME "Zero Studio")
set(VERSION_NAME "1.0.0")

if(ANDROID_OPTION)
    set_target_properties(${PROJECT_NAME} PROPERTIES
        QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android"
        QT_ANDROID_PACKAGE_NAME "org.qtproject.zzy"
        QT_ANDROID_APP_ICON "@drawable/ic_launcher"
        QT_ANDROID_APP_NAME "${APP_NAME}" # 应用名称
        QT_ANDROID_VERSION_CODE 1
        QT_ANDROID_VERSION_NAME "${VERSION_NAME}" # 版本号名称
        QT_ANDROID_APPLICATION_ARGUMENTS "--appname=${APP_NAME} --version=${VERSION_NAME}" # 启动参数
    )
endif()
