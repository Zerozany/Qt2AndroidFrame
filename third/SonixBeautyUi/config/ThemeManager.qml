pragma Singleton
import QtQuick

QtObject {

    property var currentTheme: classicTheme  // 默认主题

    property var classicTheme: ({
            "backgroundColor": {
                "light": "#f0efee",
                "dark": "#0e0d0d"
            },
            "textColor": {
                "light": "#0e0d0d",
                "dark": "#f0efee"
            },
            "textColorPressed": {
                "light": "#aca6a6",
                "dark": "#aca6a6"
            },
            "buttonColor": {
                "light": "#FFFFFF",
                "dark": "#4b4a4a"
            },
            "buttonRadius": {
                "light": 6,
                "dark": 6
            },
            "fontFamily": {
                "zh_CW": "微软雅黑",
                "en_US": "Arial"
            }
        })

    function setTheme(_theme) {
        currentTheme = _theme;
    }
}
