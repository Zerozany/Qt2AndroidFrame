import QtQuick.Window
import QtQuick.Controls
import SonixBeautyUi

Window {
    visible: true
    title: qsTr("Hello World")
    color: "#1b5acf"

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
        }

        Button {
            width: 130
            height: 60
            text: "No Click me"
        }
    }

    ApplicationTip {
        tip: "Successfully"
    }

    Item {
        Component.onCompleted: {}
    }
}
