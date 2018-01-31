import QtQuick 2.3
import 'qrc:/UI/Core' as UCore
import 'qrc:/Instances/Core' as ICore

UCore.MultiApplications {
    id: root
    applicationStack.transitionDelegate: ICore.ApplicationTransitionDelegate {}

    property alias navBar: navBar
    property bool showNavBar: false

    ICore.MultiApplicationsNavBar {
        id: navBar
        anchors.bottom: parent.bottom
        anchors.bottomMargin: !showNavBar ? -height : 0
        multiApplications: root

        Behavior on anchors.bottomMargin {
            SequentialAnimation {

                NumberAnimation {
                    easing.type: Easing.InOutCirc
                    duration: 400
                }
            }
        }
    }
}
