import QtQuick.Window
import QtQuick.Controls
import SonixBeautyUi

Window {
    id: appWindow
    color: ThemeManager.currentTheme.backgroundColor["light"]

    // 设置全屏
    visibility: Window.FullScreen
    // 无边框
    flags: Qt.FramelessWindowHint

    Column {
        anchors.centerIn: parent

        SButton {
            id: myBtn
            width: 110
            height: 45
            text: qsTr("设置")
            source: "qrc:/view/resource/setting.png"
            onClicked: {
                myBtn.text = qsTr("setting");
            }
        }
    }

    Component.onCompleted: {}
}
