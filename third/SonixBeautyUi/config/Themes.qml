pragma Singleton
import QtQuick

QtObject {
    property var lightTheme: ({
            backgroundColor: "#ffffff",
            textColor: "#333333",
            buttonColor: "#3498db",
            buttonTextColor: "#ffffff",
            buttonRadius: 6
        })

    property var darkTheme: ({
            backgroundColor: "#222222",
            textColor: "#f0f0f0",
            buttonColor: "#1abc9c",
            buttonTextColor: "#222222",
            buttonRadius: 6
        })
}
