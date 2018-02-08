import QtQuick 2.0
import QtQuick.Controls 1.4
import 'qrc:/Instances/Core' as ICore

ICore.Page {
    anchors.fill: parent
    Rectangle {
            anchors.fill: parent
            color: 'blue'

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    application.changePage('light');
                }
            }
        }
}
