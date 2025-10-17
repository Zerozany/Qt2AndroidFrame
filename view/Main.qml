import QtQuick.Window

Window {
    id: appWindow
    // 设置全屏
    visibility: Window.FullScreen
    // 无边框
    flags: Qt.FramelessWindowHint

    App {
        id: qUi
    }

    Component.onCompleted: {}
}
