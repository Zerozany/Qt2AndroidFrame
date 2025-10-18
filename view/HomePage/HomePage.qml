import QtQuick
import SonixBeautyUi

Item {
    id: root

    readonly property var elementRadius: ThemeManager.currentTheme["elementRadius"]
    readonly property var elementColor: ThemeManager.currentTheme["elementColor"]
    readonly property var borderColor: ThemeManager.currentTheme["borderColor"]
    readonly property int borderWidth: 0

    Rectangle {
        anchors.fill: parent
        radius: root.elementRadius
        color: root.elementColor
        border.color: root.borderColor
        border.width: root.borderWidth

        Column {
            anchors.fill: parent
            anchors.margins: 5
            spacing: 20

            Row {
                width: parent.width
                height: 50
                ImageLabel {
                    width: 120
                    height: 40
                    text: qsTr("设备列表")
                    source: "qrc:/view/resource/HomePageIcons/DeviceList.png"
                    fontSize: 20
                }
            }
        }
    }
}
