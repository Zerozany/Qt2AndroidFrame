# 2️⃣ Android SDK / NDK
set(ANDROID_SDK_ROOT "D:/AndroidEnv/SDK")
set(ANDROID_NDK "D:/AndroidEnv/SDK/ndk/27.2.12479018")
set(CMAKE_TOOLCHAIN_FILE "${ANDROID_NDK}/build/cmake/android.toolchain.cmake")
set(ANDROID_ABI "arm64-v8a")
set(ANDROID_PLATFORM 35)

# 3️⃣ Qt Android 路径
set(CMAKE_PREFIX_PATH "D:/Qt/6.9.2/android_arm64_v8a")
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE NEVER)

# # Android Studio 实时查看Debug日志
# .\adb devices 替换下方 -s 后的设备名称
# .\adb.exe -s emulator-5554 logcat -c; .\adb.exe -s emulator-5554 logcat *:S Qt:D QML:D default:D
