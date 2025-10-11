import QtQuick

Rectangle {

    radius: ThemeManager.currentTheme.buttonRadius
    color: ThemeManager.currentTheme.buttonColor

    property color textColor: ThemeManager.currentTheme.textColor
    property var text: null

    Text {
        color: parent.textColor
        text: parent.text
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent

        onPressed: {
            parent.textColor = ThemeManager.currentTheme.textPressedColor;
        }

        onReleased: {
            parent.textColor = ThemeManager.currentTheme.textColor;
        }

        onClicked: {}
    }
}
