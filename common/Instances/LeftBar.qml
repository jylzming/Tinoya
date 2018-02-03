import QtQuick 2.0
import QtQuick 2.7
import 'qrc:/UI/Private' as Private
import 'qrc:/UI/Controls' as UControls
import 'qrc:/UI/Core' as UCore
import 'qrc:/Instances/Core' as ICore
import 'qrc:/Instances/Controls' as IControls

Private.Control {
    id: leftbar
    anchors.top: parent.top
    anchors.left: parent.left
    height: parent.height
    property var appWindow: null
    property var hideBackBtn: null
    signal back
    Rectangle {
        id: leftbarRect
        height: parent.height
        left: parent.left
        MouseArea {
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
        }
        Column {
            Image {
                id: jiankongLB
                source: "qrc:/resources/jiankong.bmp"
            }
            Image {
                id: carparkLB
                source: "qrc:/resources/carStop.bmp"
            }
            Image {
                id: cameraLB
                source: "qrc:/resources/Camera.bmp"
            }
            Image {
                id: lightLB
                source: "qrc:/resources/LedJieNeng.bmp"
            }
            Image {
                id: policeLB
                source: "qrc:/resources/JinliXunCha.bmp"
            }
            Image {
                id: wifiLB
                source: "qrc:/resources/WifiGG.bmp"
            }
            Image {
                id: slideLB
                source: "qrc:/resources/HuaPoJK.bmp"
            }
            Image {
                id: dangerLB
                source: "qrc:/resources/danger.bmp"
            }
            Image {
                id: motoLB
                source: "qrc:/resources/JiDianJK.bmp"
            }
            Image {
                id: securityLB
                source: "qrc:/resources/LiangDong.bmp"
            }
            Image {
                id: floodLB
                source: "qrc:/resources/NeiLaoJK.bmp"
            }
        }
    }
}
