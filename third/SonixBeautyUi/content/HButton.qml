import QtQuick

Item {
    id: root
    property var text: null
    property var source: null
    property var sourcePressed: null

    readonly property color textColor: ThemeManager.currentTheme["textColor"]
    readonly property color buttonColor: ThemeManager.currentTheme["buttonColor"]
    readonly property var buttonRadius: ThemeManager.currentTheme["buttonRadius"]
    readonly property var textColorPressed: ThemeManager.currentTheme["textColorPressed"]

    signal clicked

    Rectangle {
        anchors.fill: parent
        radius: root.buttonRadius
        color: root.buttonColor

        Row {
            anchors.centerIn: parent
            spacing: 5

            Image {
                id: buttonImage
                width: root.width / 4
                height: root.height / 2
                source: root.source
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: buttonText
                color: root.textColor
                text: root.text
                font.pixelSize: 14
                font.family: ThemeManager.fontFamily
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        MouseArea {
            anchors.fill: parent

            onPressed: {
                buttonText.color = root.textColorPressed;
                buttonImage.source = root.sourcePressed;
            }

            onReleased: {
                buttonText.color = root.textColor;
                buttonImage.source = root.source;
            }

            onClicked: root.clicked()
        }
    }
}
