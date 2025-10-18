import QtQuick
import SonixBeautyUi
import QtQuick.Layouts

Item {
    id: root

    readonly property int spacing: 5
    readonly property int borderWidth: 1
    readonly property int fontSize: 14
    readonly property var elementRadius: ThemeManager.currentTheme["elementRadius"]
    readonly property var elementColor: ThemeManager.currentTheme["elementColor"]
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

                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}
