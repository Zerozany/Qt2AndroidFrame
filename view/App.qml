import QtQuick
import SonixBeautyUi

Rectangle {
    id: root

    anchors.fill: parent

    color: ThemeManager.currentTheme["backgroundColor"]

    ApplicationTip {
        window: appWindow
        tipText: "qrc:/view/resource/settingPressed.png;qrc:/view/resource/setting.pngqrc:/view/resource/settingPressed.png;qrc:/view/resource/setting.pngqrc:/view/resource/settingPressed.png;qrc:/view/resource/setting.pngqrc:/view/resource/settingPressed.png;qrc:/view/resource/setting.png"
    }

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
}
