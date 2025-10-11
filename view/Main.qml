import QtQuick.Window
import QtQuick.Controls
import SonixBeautyUi

Window {
    id: appWindow
    color: ThemeManager.currentTheme.backgroundColor

    // 设置全屏
    visibility: Window.FullScreen
    // 无边框
    flags: Qt.FramelessWindowHint

    Column {
        anchors.centerIn: parent

        Button {
            width: 130
            height: 60
            text: "Click me"
            onClicked: ThemeManager.setTheme(Themes.darkTheme)
        }

        SButton {
            width: 130
            height: 60
            text: "SButton"
        }
    }

    Component.onCompleted: {}
}
