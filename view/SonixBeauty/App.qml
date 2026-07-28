// pragma ComponentBehavior: Bound
import QtQuick
import QZeroMaterialUI

// import QtQuick.Controls
// import SonixBeautyStudio

Item {
    id: root

    // Item {
    //     anchors.fill: parent

    //     TapHandler {
    //         onTapped: {
    //             parent.forceActiveFocus();
    //         }
    //     }

    //     MaterialTextField {
    //         id: normalTextField
    //         x: 200
    //         y: 300
    //         placeholderText: qsTr("用户账号/手机号")
    //         option: ColorImage {
    //             source: "qrc:/qt/qml/SonixBeautyStudio/view/resource/setting.png"
    //             fillMode: Image.PreserveAspectFit
    //             color: Material.foreground
    //         }
    //         echoMode: TextInput.Password
    //         passwordSource: "qrc:/qt/qml/SonixBeautyStudio/view/resource/setting.png"
    //     }
    // }

    MaterialButton {
        id: btn
        anchors.left: parent.left
        anchors.leftMargin: 100
        y: 70
        text: qsTr("点击按钮")
        icon.source: "qrc:/qt/qml/SonixBeautyStudio/view/SonixBeauty/resource/setting.png"
        // display: AbstractButton.TextUnderIcon
        flat: true
        visible: false

        onClicked: {
            text = text === "qrc:/qt/qml/SonixBeautyStudio/view/SonixBeauty/resource/setting.png" ? "点击按钮" : "qrc:/qt/qml/SonixBeautyStudio/view/SonixBeauty/resource/setting.png";
            // ContentMethod.showPromptBanner(btn, "This is temporarily invalid");
            // datePopup.open();
            // mainWindow.Material.theme = Material.Dark;
            // let rect = Qt.rect(50, 50, 100, 100);
            // ScreenShotUtils.imageFormat = ScreenShotUtils.JPG;
            // ScreenShotUtils.burstshot = 3;
            // ScreenShotUtils.screenshotItem(btn, "F:/DevelopFiles/SonixBeautyStudio/Screenshoot");
            // ScreenShotUtils.screenshotItem(btn, 50, 50, 100, 100, "F:/DevelopFiles/SonixBeautyStudio/Screenshoot");
            // ScreenShotUtils.screenshotItem(btn, rect, "F:/DevelopFiles/SonixBeautyStudio/Screenshoot");
            // Translator.language = ":/i18n/qml_en.qm";
        }

        // MaterialToolTip {
        //     text: "qrc:/qt/qml/SonixBeautyStudio/view/resource/setting.png"
        //     visible: (parent as MaterialButton).down
        //     opacity: 0.2
        //     color: "blue"
        // }
    }

    // MaterialCheckBox {
    //     id: checkBox
    //     anchors.left: parent.left
    //     anchors.leftMargin: 100
    //     y: 400
    //     text: "Click"
    // }

    // BusyIndicator {
    //     anchors.centerIn: parent
    //     running: checkBox.checked
    // }

    // DatePopup {
    //     id: datePopup
    // }

    // PageBrightness {
    //     id: pageBrightness
    // }

    // Slider {
    //     anchors.bottom: parent.bottom
    //     anchors.horizontalCenter: parent.horizontalCenter

    //     from: 0
    //     to: 1

    //     value: pageBrightness.brightness

    //     onValueChanged: {
    //         pageBrightness.brightness = value;
    //     }
    // }

    // DynamicIsland {
    //     visible: !stackView.currentItem instanceof LoginPage
    // }
}
