import QtQuick

Rectangle {
    id: root
    radius: ThemeManager.currentTheme.buttonRadius["light"]
    color: ThemeManager.currentTheme.buttonColor["light"]

    property color textColor: ThemeManager.currentTheme.textColor["light"]
    property var layout: Qt.Horizontal
    // property var layout: Qt.Vertical
    property var text: null
    property var source: null
    property var sourcePressed: null

    signal clicked

    Row {
        anchors.centerIn: parent
        spacing: 5

        Image {
            width: root.width / 4
            height: root.height / 2
            source: root.source
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            color: root.textColor
            text: root.text
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    MouseArea {
        anchors.fill: parent

        onPressed: {
            parent.textColor = ThemeManager.currentTheme.textColorPressed["light"];
        }

        onReleased: {
            parent.textColor = ThemeManager.currentTheme.textColor["light"];
        }

        onClicked: parent.clicked()
    }
}
