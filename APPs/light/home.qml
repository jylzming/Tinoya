import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    color: 'red'

    MouseArea{
        anchors.fill: parent
        onClicked: {
            application.changePage('presetlist');
        }
    }
}

