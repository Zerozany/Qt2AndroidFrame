import QtQuick

Rectangle {
    id: applicationTip
    property string tip: ""
    property int interval: 2000

    width: textTip.width + GlobalVar.dpW(120)
    height: textTip.height + GlobalVar.dpH(10)
    radius: GlobalVar.dpMin(5)
    color: "#dd000000"
    anchors {
        centerIn: parent ? parent : null
    }
    border {
        color: "#88ffffff"
        width: 1
    }

    SequentialAnimation {
        running: true
        ParallelAnimation {
            OpacityAnimator {
                target: applicationTip
                duration: 300
                from: 0
                to: 1
            }
            ScaleAnimator {
                target: applicationTip
                duration: 300
                from: 0.8
                to: 1
                easing.type: Easing.OutQuart
            }
        }
        PauseAnimation {
            duration: applicationTip.interval
        }
        OpacityAnimator {
            target: applicationTip
            duration: 300
            to: 0
        }
        ScriptAction {
            script: applicationTip.destroy()
        }
    }

    Text {
        id: textTip
        text: parent.tip
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        anchors.centerIn: parent
        style: Text.Outline
        styleColor: "black"
        font.pointSize: GlobalVar.theme.fontSize.sizeM
        // font.family: GlobalVar.theme.fontFamily[appSetting.language]
        Component.onCompleted: {
            Qt.callLater(function () {
                if (applicationTip.parent) {
                    width = Math.min(width, applicationTip.parent.width / 2);
                }
            });
        }
    }
}
