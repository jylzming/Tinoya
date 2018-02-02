import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import 'qrc:/UI/Private' as Private
import 'qrc:/UI/Controls' as UControls
import 'qrc:/UI/Core' as UCore
import 'qrc:/Instances/Core' as ICore
import 'qrc:/Instances/Controls' as IControls

Private.Control {
    id: root
    width: parent.width
    anchors.top: parent.top
    anchors.left: parent.left
    height: 70
    property var appWindow: null
    property VirtualApplication application: null
    signal back
    Loader{
        id: pageLoader
    }

    function changePage2Home(){
        pageLoader.source = "qrc:/home/home.qml"
        pageLoader.update()
    }
    //标题部分
    Rectangle{
        id: titleBar;
        width: parent.width;
        height: 70;
        color: "#17202C" //color: "#777777"

       /* gradient: Gradient {
            GradientStop { position: 0.0; color: "#17202C" }
            GradientStop { position: 0.5; color: "#777777" }
        }*/

        MouseArea {
            id: mouse
            anchors.fill: parent
            drag.target: parent.parent
            property point clickPos: "0,0"
            acceptedButtons: Qt.LeftButton //只处理鼠标左键
            onPressed: { //接收鼠标按下事件
                //console.log("titleBar Pressed!");
                clickPos  = Qt.point(mouse.x,mouse.y);
            }
            onDoubleClicked: {
                console.log("titleBar Double click!")
                if(appWindow.visibility == Window.Windowed){
                    appWindow.visibility = Window.FullScreen;
                }
                else{
                    appWindow.visibility = Window.Windowed;
                }
            }
            onPositionChanged: {
                if(appWindow.visibility == Window.Windowed) {
                    var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    console.debug("deltax = ",delta.x,"deltay = ",delta.y)
                    appWindow.setX(appWindow.x+delta.x)
                    appWindow.setY(appWindow.y+delta.y)
                    console.debug("appx = ",appWindow.x+delta.x,"appy = ",appWindow.y+delta.y)
                    console.debug("titleBarw = ",titleBar.width,"titleBarh = ",titleBar.height)
                }
            }
        }

        Image {
            id: image_logo
            width: 50
            height: 50
            source: "qrc:/resources/tinoya.png"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 10
            opacity: logoArea.containsMouse ? 0.5 : 1.0;
            MouseArea{
                id: logoArea;
                anchors.fill: parent;
                cursorShape: "PointingHandCursor"
                hoverEnabled: true;
                propagateComposedEvents: false
                acceptedButtons: Qt.LeftButton;
                onClicked: {
                    console.log("Logo click!");
                    //application.changePage("qrc:/home/home.qml")
                    //application.multiApplications.changeApplication("home");
                    changePage2Home()
                }
            }
        }
        Column {
            id: titleText
            spacing: 5
            anchors.left: image_logo.right
            anchors.top: image_logo.top
            anchors.bottom: image_logo.bottom
            anchors.leftMargin: 20

            Text {
                id: logoCNname
                text: qsTr("天眼预警联动")
                font.family: "宋体"
                font.pointSize: 14
                font.weight: Font.DemiBold
                color: "#FFFFFF"

                opacity: cnNameArea.containsMouse ? 0.5 : 1.0;
                MouseArea{
                    id: cnNameArea;
                    anchors.fill: parent;
                    hoverEnabled: true;
                    propagateComposedEvents: false
                    cursorShape: "PointingHandCursor"
                    acceptedButtons: Qt.LeftButton;
                    onClicked: {
                        console.log("LogoName click!");
                    }
                }
            }
            Text {
                id: logoENname
                text: qsTr("Tinoya System")
                font.family: "Helvetica"
                font.pointSize: 14
                font.weight: Font.DemiBold
                color: "#EEEEEE"

                opacity: enNameArea.containsMouse ? 0.5 : 1.0;
                MouseArea{
                    id: enNameArea;
                    anchors.fill: parent;
                    hoverEnabled: true;
                    propagateComposedEvents: false
                    cursorShape: "PointingHandCursor"
                    acceptedButtons: Qt.LeftButton;
                    onClicked: {
                        console.log("LogoName click!");

                    }
                }
            }

        }

        Text {
            id: user
            text: qsTr("Admin")
            font.family: "Helvetica"
            font.pointSize: 14
            font.weight: Font.DemiBold
            color: "#EEEEEE"
            anchors.right: btnSet.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 30
            opacity: userArea.containsMouse ? 0.5 : 1.0
            MouseArea{
                id: userArea;
                anchors.fill: parent;
                hoverEnabled: true;
                propagateComposedEvents: false
                acceptedButtons: Qt.LeftButton;
                cursorShape: "PointingHandCursor"
                onClicked: {
                    console.log("userName click!");

                }
            }
        }
        Image {
            id: btnSet
            source: "qrc:/resources/btnSetting1.png"
            width: 35
            height: 35
            anchors.right: separateRect.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 20
            opacity: setArea.containsMouse ? 0.5 : 1.0
            MouseArea{
                id: setArea;
                anchors.fill: parent;
                hoverEnabled: true;
                propagateComposedEvents: false
                acceptedButtons: Qt.LeftButton;
                cursorShape: "PointingHandCursor"
                onClicked: {
                    console.log("SettingImg click!");
                }
            }
        }

        //分隔条
        Rectangle{
            id: separateRect
            width: 1
            height: 35
            color: "#505050"
            anchors.right: btnWindow.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 20
        }

        //添加控制最大最小关闭按钮
        Row{
            id: btnWindow
            spacing: 16;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.right: parent.right;
            anchors.rightMargin: 20;

            //最小化
            Image{
                id: btnMini;
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter;
                source: "qrc:/resources/btnMini1.png";
                opacity: miniArea.containsMouse ? 1.0 : 0.5;
                MouseArea{
                    id: miniArea;
                    anchors.fill: parent;
                    hoverEnabled: true;
                    propagateComposedEvents: false
                    acceptedButtons: Qt.LeftButton;
                    onClicked: {
                        //console.log("minimiun click!");
                        if(appWindow == null)
                            return;
                        appWindow.visibility = Window.Minimized;
                    }
                }
            }

            //最大化
            Rectangle{
                width: 40;
                height: 40;
                color: "#17202C";
                Rectangle{
                    id: btnMaximum;
                    anchors.centerIn: parent;
                    anchors.verticalCenter: parent.verticalCenter
                    width: 25;
                    height: 16;
                    border.width: 2;
                    border.color: maxiArea.containsMouse ? "#FFFFFF" : "#858585";
                    color: "#17202C";
                    radius: 2;
                }
                MouseArea{
                    id: maxiArea
                    anchors.fill: parent;
                    hoverEnabled: true;
                    acceptedButtons: Qt.LeftButton
                    propagateComposedEvents: false
                    onReleased: {
                        //console.log("maximun click!");
                        if(appWindow == null)
                            return;
                        if(appWindow.visibility == Window.FullScreen) {
                            appWindow.showNormal();
                            //console.log("Clicked, to fullscreen")
                        }
                        else{
                            appWindow.visibility = Window.FullScreen;
                            //console.log("Clicked, to normal window")
                        }
                    }
                }

            }

            //关闭
            Image{
                id: btnClose;
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter;
                source: "qrc:/resources/btnClose1.png";
                opacity: closeArea.containsMouse ? 1.0 : 0.5;

                MouseArea{
                    id: closeArea;
                    anchors.fill: parent;
                    acceptedButtons: Qt.LeftButton;
                    hoverEnabled: true;
                    propagateComposedEvents: false
                    onReleased: {
                        //console.log("close click!");
                        if(appWindow == null)
                            return;
                        appWindow.close();
                    }
                }
            }
        }
    }
}
