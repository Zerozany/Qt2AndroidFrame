import QtQuick
import SonixBeautyUi
import QtQuick.Layouts

Item {
    id: root
    property var deviceName: null

    readonly property int spacing: 5
    readonly property int borderWidth: 1
    readonly property int fontSize: 14
    readonly property string deviceImageSource: "qrc:/view/resource/HomePageIcons/ProbeDevice.png"
    readonly property var elementRadius: ThemeManager.currentTheme["elementRadius"]
    readonly property var elementColor: ThemeManager.currentTheme["backgroundColor"]
    readonly property var borderColor: ThemeManager.currentTheme["borderColor"]

    Rectangle {
        anchors.fill: parent
        radius: root.elementRadius
        color: root.elementColor
        border.color: root.borderColor
        border.width: root.borderWidth

        RowLayout {
            anchors.fill: parent
            spacing: root.spacing

            ImageLabel {
                Layout.preferredWidth: 150
                Layout.preferredHeight: 40
                Layout.leftMargin: 30
                text: root.deviceName
                source: root.deviceImageSource
                fontSize: root.fontSize
                fontBold: true
                Layout.alignment: Qt.AlignVCenter
            }

            Item {
                Layout.fillWidth: true
            }

            SButton {
                text: qsTr("连接")
                Layout.preferredWidth: 80
                Layout.preferredHeight: 35
                Layout.rightMargin: 30
                layout: Qt.Vertical
                source: "qrc:/view/resource/HomePageIcons/connect.png"
                sourcePressed: "qrc:/view/resource/HomePageIcons/connectPressed.png"
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}
