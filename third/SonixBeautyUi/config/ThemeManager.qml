pragma Singleton
import QtQuick

QtObject {
    property var currentTheme: Themes.lightTheme  // 默认主题

    function setTheme(_theme) {
        currentTheme = _theme;
    }
}
