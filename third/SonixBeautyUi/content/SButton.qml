import QtQuick
import SonixBeautyUi
import QtQuick.Layouts

Item {
    id: root
    property var text: null
    property var source: null
    property var sourcePressed: null
    property var layout: Qt.Horizontal

    readonly property int spacing: 5
    readonly property int fontSize: 14
    readonly property color textColor: ThemeManager.currentTheme["textColor"]
    readonly property color buttonColor: ThemeManager.currentTheme["buttonColor"]
    readonly property var elementRadius: ThemeManager.currentTheme["elementRadius"]
    readonly property var textColorPressed: ThemeManager.currentTheme["textColorPressed"]
    // readonly property var textFontFamily: ThemeManager.fontFamily

    signal clicked

    Rectangle {
        id: rectangle
        anchors.fill: parent
        radius: root.elementRadius
        color: root.buttonColor
        property bool pressedTag: false

        ColumnLayout {
            anchors.centerIn: parent
            spacing: root.spacing
            visible: root.layout == Qt.Horizontal ? true : false

            Image {
                Layout.preferredWidth: root.width / 2
                Layout.preferredHeight: root.height / 4
                source: rectangle.pressedTag ? root.sourcePressed : root.source
                fillMode: Image.PreserveAspectFit
                Layout.alignment: Qt.AlignHCenter
            }

            Text {
                color: rectangle.pressedTag ? root.textColorPressed : root.textColor
                text: root.text
                font.pixelSize: root.fontSize
                wrapMode: Text.WordWrap
                // font.family: root.textFontFamily
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }

        RowLayout {
            anchors.centerIn: parent
            spacing: root.spacing
            visible: root.layout == Qt.Vertical ? true : false

            Image {
                Layout.preferredWidth: root.width / 4
                Layout.preferredHeight: root.height / 2
                source: rectangle.pressedTag ? root.sourcePressed : root.source
                fillMode: Image.PreserveAspectFit
                Layout.alignment: Qt.AlignVCenter
            }

            Text {
                color: rectangle.pressedTag ? root.textColorPressed : root.textColor
                text: root.text
                font.pixelSize: root.fontSize
                wrapMode: Text.WordWrap
                // font.family: root.textFontFamily
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
            }
        }

        MouseArea {
            anchors.fill: parent

            onPressed: {
                rectangle.pressedTag = true;
            }

            onReleased: {
                rectangle.pressedTag = false;
            }

            onClicked: root.clicked()
        }
    }
}
