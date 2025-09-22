target_compile_features(${PROJECT_NAME}
    PRIVATE
    cxx_std_23
)

if(MSVC)
    add_compile_options("/FS")
endif()

if(WIN32)
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND windeployqt.exe $<$<CONFIG:Debug>:--debug> $<$<CONFIG:Release>:--release>
        --qmldir "${CMAKE_SOURCE_DIR}/view"
        $<TARGET_FILE:${PROJECT_NAME}>
    )
elseif(ANDROID)
    # # Android Studio 实时查看Debug、QML打印
    # .\adb.exe logcat -c ; .\adb.exe logcat -s "qml:*" "default:D"

    # 统一定义应用名和版本号
    set(PACKAGE_NAME "org.qtproject.SonixBeauty")
    set(APP_NAME "SonixBeauty Studio")
    set(VERSION_NAME "1.0.0.0")

    set_target_properties(${PROJECT_NAME} PROPERTIES
        QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_SOURCE_DIR}/third/android/android-build"
        QT_ANDROID_PACKAGE_NAME "${PACKAGE_NAME}"
        QT_ANDROID_APP_ICON "@drawable/ic_launcher"
        QT_ANDROID_APP_NAME "${APP_NAME}" # 应用名称
        QT_ANDROID_APP_DESCRIPTION "A beautiful application created with Qt" # 应用描述
        QT_ANDROID_VERSION_CODE 1 # 应用版本号
        QT_ANDROID_VERSION_NAME "${VERSION_NAME}" # 版本号名称
        QT_ANDROID_APPLICATION_ARGUMENTS "--appname=${APP_NAME} --version=${VERSION_NAME}" # 启动参数

        # Android 环境变量
        QT_ANDROID_ENVIRONMENT_VARIABLES "qt_android_no_exit_call=1"
    )
endif()
