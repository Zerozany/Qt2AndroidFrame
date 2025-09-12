# 2️⃣ Android SDK / NDK
# 设置系统环境变量 JAVA_HOME 自定义 "D:\Android Studio\jbr"
set(ANDROID_SDK_ROOT "D:/AndroidEnv/SDK")
set(ANDROID_NDK "D:/AndroidEnv/SDK/ndk/27.2.12479018")
set(CMAKE_TOOLCHAIN_FILE "${ANDROID_NDK}/build/cmake/android.toolchain.cmake")
set(ANDROID_ABI "x86_64")
set(ANDROID_PLATFORM 35)

# 3️⃣ Qt Android 路径
set(CMAKE_PREFIX_PATH "D:/Qt/6.9.2/android_x86_64")
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE NEVER)

# Android Studio 实时查看打印
# .\adb devices 替换下方 -s 后的设备名称
# PS D:\AndroidEnv\SDK\platform-tools> .\adb -s emulator-5554 logcat -s Qt QtActivity
