pragma Singleton
import QtQuick

QtObject {
    property var lightTheme: ({
            backgroundColor: "#FFFDFB",
            textColor: "#333333",
            textPressedColor: "#DCDCDC",
            buttonColor: "#FFFFFF",
            buttonRadius: 6
        })

    property var darkTheme: ({
            backgroundColor: "#222222",
            textColor: "#333333",
            textPressedColor: "#DCDCDC",
            buttonColor: "#1abc9c",
            buttonRadius: 6
        })
}
