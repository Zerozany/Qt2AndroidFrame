import QtQuick
import SonixBeautyUi
import QtQuick.Layouts

Item {
    id: root
    property var text: null
    property var source: null
    property var fontSize: null

    readonly property int spacing: 5
    readonly property color textColor: ThemeManager.currentTheme["textColor"]
    readonly property color imageLaberColor: ThemeManager.currentTheme["imageLaberColor"]
    readonly property var elementRadius: ThemeManager.currentTheme["elementRadius"]
    // readonly property var textFontFamily: ThemeManager.fontFamily

    Rectangle {
        anchors.fill: parent
        radius: root.elementRadius
        color: root.imageLaberColor

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
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}
