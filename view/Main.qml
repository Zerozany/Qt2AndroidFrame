import QtQuick.Window
import SonixBeautyUi

Window {
    id: appWindow

    color: ThemeManager.currentTheme["backgroundColor"]

    // 设置全屏
    visibility: Window.FullScreen
    // 无边框
    flags: Qt.FramelessWindowHint

    Column {
        anchors.centerIn: parent
        spacing: 20

        HButton {
            id: myBtn
            width: 110
            height: 45
            text: qsTr("设置")
            source: "qrc:/view/resource/setting.png"
            sourcePressed: "qrc:/view/resource/settingPressed.png"
            onClicked: {
                myBtn.text = qsTr("setting");
            }
        }

        VButton {
            id: myBtn_1
            width: 60
            height: 80
            text: qsTr("主题")
            source: "qrc:/view/resource/setting.png"
            sourcePressed: "qrc:/view/resource/settingPressed.png"
            onClicked: {
                myBtn_1.text = qsTr("Theme");
            }
        }
    }

    Component.onCompleted: {}
}
