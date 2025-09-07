import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {

    visible: true
    title: qsTr("Hello World")
    color: "#1b5acf"

    // 设置全屏
    visibility: Window.FullScreen

    // 无边框
    flags: Qt.FramelessWindowHint

    Button {
        width: 130
        height: 60
        text: "Click me"
        anchors.centerIn: parent
    }
}
