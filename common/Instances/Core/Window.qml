import QtQuick 2.3
import 'qrc:/UI/Core' as UCore
import 'qrc:/Instances/Core' as ICore

UCore.Window {
    id: root
    width: 1500
    height: 850
    minimumWidth: 1200
    minimumHeight: 851
//    bgSource: 'qrc:/resources/BG2.jpg'

    property bool hideStatusBar: false
    property alias statusBar: statusBar
    property bool backBtnEnable: true
    property alias multiApplications: multiApplications

    property bool useStatusAnimation: true

   ICore.StatusBar {
        id: statusBar
        appWindow: root
        anchors.top: parent.top
        anchors.topMargin: hideStatusBar ? -height : 0

        onBack: {
            var currentApplicationInfo = multiApplications.currentApplicationInfo();

            if (currentApplicationInfo && currentApplicationInfo.item && backBtnEnable) {
                currentApplicationInfo.item.back();
            }
        }

        Behavior on anchors.topMargin {
            enabled: useStatusAnimation
            SequentialAnimation {
                PauseAnimation {
                    duration: 600
                }
                NumberAnimation {
                    easing.type: Easing.InOutCirc
                    duration: 600
                }
            }
        }
    }
//        }
    ICore.MultiApplications {
        id: multiApplications
        appWindow: root
        width: parent.width
        anchors.top: statusBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        Component.onCompleted: {
            console.debug("height: ",height)
        }
    }
}
