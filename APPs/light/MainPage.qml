import QtQuick 2.0
import QtQuick.Controls 1.4
import QtWebSockets 1.1
import 'qrc:/Instances/Core' as ICore

ICore.Page{
    anchors.fill: parent

/*    Rectangle {
        anchors.fill: parent
        color: 'blue'

        MouseArea{
            anchors.fill: parent
            onClicked: {
                application.changePage('light');
            }
        }
    }*/
    Rectangle{
        id: lightRect
        width: parent.width
        height: parent.height
        color: "#CCCCCC"

        WebSocket {
            id: socket
            url: "ws://192.168.1.109:777"
            active: true
            onTextMessageReceived: {
                messageBox.text = messageBox.text + "\nReceived message: " + message
            }
            onStatusChanged: if (socket.status == WebSocket.Error) {
                                 console.log("Error: " + socket.errorString)
                             } else if (socket.status == WebSocket.Open) {
                                 socket.sendTextMessage("Hello World")
                             } else if (socket.status == WebSocket.Closed) {
                                 messageBox.text += "\nSocket closed"
                             }
        }

        Text {
            id: messageBox
            height: 30
            width: parent.width
            text: socket.status == WebSocket.Open ? qsTr("Socket status:Open!") : qsTr("Socket status:Closed!")
            MouseArea{
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                onClicked: {
                    socket.active = true
                    socket.sendTextMessage(qsTr("Hello Ming!\n"))
                }
            }
        }
        //区域栏
        Rectangle{
            id: zone
            width: parent.width
            height: zoneRow.height+10
            anchors.top: messageBox.bottom
            anchors.topMargin: 20
            Row{
                id: zoneRow
                spacing: 10
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    id: zone1
                    text: qsTr("领亚松山湖工业园")
                    font.family: "Helvetica"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    color: "black"
                    MouseArea{
                        anchors.fill: parent;
                        acceptedButtons: Qt.LeftButton;
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                Rectangle{
                    width: 1; height: parent.height; color: "black";
                }
                Text {
                    id: zone2
                    text: qsTr("领亚企石AC工业园")
                    font.family: "Helvetica"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    color: "gray"
                    MouseArea{
                        anchors.fill: parent;
                        acceptedButtons: Qt.LeftButton;
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                Rectangle{
                    width: 1; height: parent.height; color: "black";
                }
                Text {
                    id: zone3
                    text: qsTr("领亚企石瑞桥工业园")
                    font.family: "Helvetica"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    color: "gray"
                    MouseArea{
                        anchors.fill: parent;
                        acceptedButtons: Qt.LeftButton;
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                Rectangle{
                    width: 1; height: parent.height; color: "black";
                }
                Text {
                    id: zone4
                    text: qsTr("领亚深圳工业园")
                    font.family: "Helvetica"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    color: "gray"
                    MouseArea{
                        anchors.fill: parent;
                        acceptedButtons: Qt.LeftButton;
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                Rectangle{
                    width: 1; height: parent.height; color: "black";
                }
                Text {
                    id: zone5
                    text: qsTr("苏州新亚工业园")
                    font.family: "Helvetica"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    color: "gray"
                    MouseArea{
                        anchors.fill: parent;
                        acceptedButtons: Qt.LeftButton;
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
        //标题栏
        Rectangle{
            id: lightControlRect
            anchors.top: zone.bottom
            width: parent.width
            height: lightControlText.height+10
            color: "#02222B"
            Text {
                id: lightControlText
                text: qsTr("控制管理")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                font.family: "Helvetica"
                font.pointSize: 16
                font.weight: Font.DemiBold
                color: "white"
            }
        }
        //工具栏
        Rectangle{
            id: cntlRect
            anchors.top: lightControlRect.bottom
            width: parent.width
            height: 30
            anchors.rightMargin: 20
            Row {
                spacing: 30
                anchors{
                    right: parent.right
                    rightMargin: 20
                    verticalCenter: parent.verticalCenter
                }

                Rectangle {
                    id: off
                    width: 70
                    height: 30
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                    }
                    Image {
                        id: offImg
                        source: "qrc:/resources-light/lightoff.png"
                        width: 30
                        height: 30
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Text {
                        id: offText
                        text: qsTr("关灯")
                        font.family: "宋体"
                        font.pointSize: 14
                        font.weight: Font.DemiBold
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Rectangle {
                    id: on
                    width: 70
                    height: 30
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                    }
                    Image {
                        id: onImg
                        source: "qrc:/resources-light/lighton.png"
                        height: 30
                        width: 30
                        anchors.left: parent.left
                    }
                    Text {
                        id: onText
                        text: qsTr("开灯")
                        font.family: "宋体"
                        font.pointSize: 14
                        font.weight: Font.DemiBold
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Rectangle {
                    id: dimmingRect
                    height: 30
                    width: dimming.width+dimmingEditRect.width+dimmingRange.width
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                    Rectangle {
                        id: dimming
                        width: 70
                        height: 30
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: "PointingHandCursor"
                        }
                        Image {
                            id: dimmingImg
                            source: "qrc:/resources-light/brightness.png"
                            height: 30
                            width: 30
                            anchors.left: parent.left
                        }
                        Text {
                            id: dimmingText
                            text: qsTr("调光")
                            font.family: "宋体"
                            font.pointSize: 14
                            font.weight: Font.DemiBold
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Rectangle {
                        id: dimmingEditRect
                        width: 50
                        height: 25
                        border.width: 1
                        anchors.left: dimming.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.IBeamCursor
                        }

                        TextEdit {
                            id: dimmingTextEdit
                            font.pointSize: 14
                            width: 50
                            height: parent.height
                            anchors.left: dimmingText.Right
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                   Text {
                        id: dimmingRange
                        text: qsTr("0~100%")
                        font.family: "宋体"
                        font.pointSize: 14
                        font.weight: Font.DemiBold
                        anchors.left: dimmingEditRect.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            anchors.top: cntlRect.bottom
            //anchors.fill: parent
            ListModel {
                id: tableModel
                ListElement {
                    checked: true
                    gateway: "LinoyaGW01"
                    address: "001"
                    lightID: "8002"
                    lightStat: "off"
                    netStat: "offline"
                    dimming: "--"
                    voltage: "--"
                    current: "--"
                    power: "--"
                    updateTime: "--"
                }
                ListElement {
                    checked: false
                    gateway: "LinoyaGW01"
                    address: "002"
                    lightID: "8003"
                    lightStat: "off"
                    netStat: "offline"
                    dimming: "--"
                    voltage: "--"
                    current: "--"
                    power: "--"
                    updateTime: "--"
                }
                ListElement {
                    checked: false
                    gateway: "LinoyaGW01"
                    address: "003"
                    lightID: "8004"
                    lightStat: "off"
                    netStat: "offline"
                    dimming: "--"
                    voltage: "--"
                    current: "--"
                    power: "--"
                    updateTime: "--"
                }
            }
            TableView {
                id: tableView
                model: tableModel
                width: parent.width
                height: parent.height
                TableViewColumn {
                    id: checkedColumn
                    role: "checked"
                    title: qsTr( "Checked" )
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "gateway"
                    title: qsTr("网关")
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "address"
                    title: qsTr("地址")
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "lightID"
                    title: qsTr("ID")
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "lightStat"
                    title: qsTr("路灯状态")
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "netStat"
                    title: qsTr("网络状态")
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "dimming"
                    title: qsTr("亮度")
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "voltage"
                    title: qsTr("电压")
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "current"
                    title: qsTr("电流")
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "power"
                    title: qsTr("功率")
                    width: parent.width/11
                }
                TableViewColumn {
                    role: "updateTime"
                    title: qsTr("更新时间")
                    width: parent.width/11
                }

                itemDelegate: Item {
                    height: 30
                    CheckBox
                    {
                        anchors.centerIn: parent
                        checked: styleData.value
                        visible: isCheckColumn( styleData.column )
                    }
                    Text
                    {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        text: styleData.value
                        //color: isCheckColumn( styleData.column )? "black": styleData.value
                        visible: !isCheckColumn( styleData.column )
                    }

                    function isCheckColumn( columnIndex )
                    {
                        return tableView.getColumn( columnIndex ) === checkedColumn
                    }
                }
            }
        }
    }
}

