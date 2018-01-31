import QtQuick 2.0
import QtQuick.Controls 1.2

Image {
    id: root

    signal clicked
    signal doubleClicked
    signal longPressed
    signal pressed
    signal released

    opacity: mouseArea.containsMouse? 0.5:1.0

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        hoverEnabled: true
    }

    Connections {
            target: mouseArea
            onClicked: clicked()
            onDoubleClicked: doubleClicked()
            onPressAndHold: longPressed()
            onPressed: pressed()
            onReleased: released()
        }
}

