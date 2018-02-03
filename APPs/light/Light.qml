import QtQuick 2.0
import 'qrc:/Instances/Core' as ICore

ICore.Page{
    anchors.fill: parent

    Rectangle {
        id:rect1
        width: parent.width
        height: parent.height/2
        anchors.top: parent.top

        color: 'red'

        MouseArea{
            anchors.fill: parent
            onClicked: {
                application.back();
            }
        }
    }
    Rectangle {
        id:rect2
        width: parent.width
        height: parent.height/2
        anchors.top: rect1.bottom

        color: 'yellow'

        MouseArea{
            anchors.fill: parent
            onClicked: {
                application.multiApplications.back();
            }
        }
    }
}
