pragma Singleton
import QtQuick.Window
import QtQuick

QtObject {
    // DPI
    property var designWidth: 2560
    property var designHeight: 1600
    property var screenWide: Screen.width > Screen.height ? Screen.height : Screen.width
    property var screenHeight: Screen.width > Screen.height ? Screen.width : Screen.height
    property var multiplierW: screenWide / designWidth
    property var multiplierH: screenHeight / designHeight

    function dpH(numbers) {
        return numbers * multiplierH;
    }

    function dpW(numbers) {
        return numbers * multiplierW;
    }

    function dpMin(numbers) {
        return numbers * Math.min(multiplierH, multiplierW);
    }

    function dpMax(numbers) {
        return numbers * Math.max(multiplierH, multiplierW);
    }

    function dpAvg(numbers) {
        return numbers * (multiplierH + multiplierW) / 2;
    }

    // 主题系列
    property var theme: {
        "fontFamily": {
            "zh_CW": "微软雅黑",
            "en_US": "Arial"
        },
        "fontSize": {
            "sizeXXS": dpMax(10),
            "sizeXS": dpMax(12),
            "sizeS": dpMax(14),
            "sizeM": dpMax(16),
            "sizeL": dpMax(18),
            "sizeXL": dpMax(20),
            "sizeXXL": dpMax(22)
        },
        "textColor": {
            "black": "#000",
            "white": "#fff",
            "midGray": "#777"
        },
        "blackGroundColor": {
            "black": "#000",
            "white": "#fff",
            "colorSelected": "#5995CD",
            "colorHovered": "#656B74",
            "colorNormal": "#252C2D"
        }
    }
    // 运动传感器开关
    property bool motionSensor: true
}
