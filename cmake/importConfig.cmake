target_compile_features(${PROJECT_NAME}
    PRIVATE
    cxx_std_23
)

if(MSVC)
    add_compile_options(/utf-8)
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
    # 连接模拟器
    # .\adb.exe logcat -c ; .\adb.exe logcat -s "qml:*" "System.out:I" "default:D"
    # 连接真机（d933be15 为真实设备序号）
    # .\adb.exe devices
    # .\adb.exe -s d933be15 logcat -c;.\adb.exe -s d933be15 logcat -s "qml:*" "System.out:I" "default:D"
    # 真机自动安装apk（F:\DevelopFiles\AndroidFrame\build\AndroidDebug\android-build\SonixBeautyStudio.apk为apk所在路径）
    # .\adb.exe -s d933be15 install -r F:\DevelopFiles\AndroidFrame\build\AndroidDebug\android-build\SonixBeautyStudio.apk
    # powershell获取脚本权限：'Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass'

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

    # 精确位置权限 (API 1+，Android 12+ 可添加 neverForLocation)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.ACCESS_FINE_LOCATION
        ATTRIBUTES
        minSdkVersion 1
        usesPermissionFlags neverForLocation
    )

    # 获取 Wi-Fi 状态权限 (API 1+)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.ACCESS_WIFI_STATE
        ATTRIBUTES
        minSdkVersion 1
    )

    # 修改 Wi-Fi 状态权限 (API 1+)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.CHANGE_WIFI_STATE
        ATTRIBUTES
        minSdkVersion 1
    )

    # 修改网络状态权限 (API 1+)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.CHANGE_NETWORK_STATE
        ATTRIBUTES
        minSdkVersion 1
    )

    # 获取网络状态权限 (API 1+)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.ACCESS_NETWORK_STATE
        ATTRIBUTES
        minSdkVersion 1
    )

    # 修改系统设置权限 (API 1+)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.WRITE_SETTINGS
        ATTRIBUTES
        minSdkVersion 1
    )

    # 保持屏幕唤醒权限 (API 1+)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.WAKE_LOCK
        ATTRIBUTES
        minSdkVersion 1
    )

    # 前台服务权限 (API 28+)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.FOREGROUND_SERVICE
        ATTRIBUTES
        minSdkVersion 28
    )

    # 忽略电池优化 (API 23+)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS
        ATTRIBUTES
        minSdkVersion 23
    )

    # 监听系统启动广播 (API 1+)
    qt_add_android_permission(${PROJECT_NAME}
        NAME android.permission.RECEIVE_BOOT_COMPLETED
        ATTRIBUTES
        minSdkVersion 1
    )
endif()
