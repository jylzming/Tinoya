import QtQuick 2.3
import QtQuick.Controls 1.2
import 'qrc:/UI/Private' as Private
import 'qrc:/UI/Controls' as UControls
import 'qrc:/UI/Core' as UCore

Private.Control {
    id: root
    width: parent.width
    height: 50

    property var multiApplications: null


    Component.onCompleted: {

    }

    Rectangle{
        id: statusBar;
        width: parent.width;
        height: 50;
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        color: "#152830"

        Image {
            id: messageIcon1
            width: 50
            height: 50
            source: "qrc:/resources/message.png"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
        }

        Image {
            id: inlineIcon
            source: "qrc:/resources/biohazard.png"
            width: 30
            height: 30
            anchors.left: messageIcon1.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 50
        }
        Row {
            id: msgStatusBar
            spacing: 20
            anchors {
                left: inlineIcon.right
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }

            Text {
                id: msgStatus1
                text: qsTr("设备数量/在线数量 4/4")
                font.family: "Helvetica"
                font.pointSize: 12
                font.weight: Font.DemiBold
                color: "#EE6000"
            }
            Text {
                id: msgStatus2
                text: qsTr("监控摄像 187/180")
                font.family: "Helvetica"
                font.pointSize: 12
                font.weight: Font.DemiBold
                color: "#EE6000"
            }
            Text {
                id: msgStatus3
                text: qsTr("路灯 140/134 ")
                font.family: "Helvetica"
                font.pointSize: 12
                font.weight: Font.DemiBold
                color: "#EE6000"
            }
        }
        Rectangle{
            id: msgCompanyRect
            width: msgCompanyText.width
            height: parent.height
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "#14272F"

            Text {
                id: msgCompanyText
                text: qsTr("天眼技术服务有限公司 Tinoya Technology Co., Ltd ")
                font.family: "Helvetica"
                font.pointSize: 12
                font.weight: Font.DemiBold
                color: "#EEEEEE"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
