import QtQuick
import SonixBeautyUi
import QtQuick.Layouts

Item {
    id: root
    property var text: null
    property var source: null
    property var fontSize: 14
    property var fontBold: false

    readonly property int spacing: 0
    readonly property color textColor: ThemeManager.currentTheme["textColor"]
    readonly property color elementColor: ThemeManager.currentTheme["elementColor"]
    readonly property var elementRadius: ThemeManager.currentTheme["elementRadius"]
    // readonly property var textFontFamily: ThemeManager.fontFamily

    Rectangle {
        anchors.fill: parent
        radius: root.elementRadius
        color: root.elementColor

        RowLayout {
            anchors.centerIn: parent
            spacing: root.spacing

            Image {
                Layout.preferredWidth: root.width / 4
                Layout.preferredHeight: root.height / 2
                source: root.source
                fillMode: Image.PreserveAspectFit
                Layout.alignment: Qt.AlignVCenter
            }

            Text {
                text: root.text
                color: root.textColor
                font.pixelSize: root.fontSize
                font.bold: root.fontBold
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}
