import QtQuick 2.0
import 'qrc:/Instances/Core' as ICore

ICore.VirtualApplication {
    pages: ({
         main: { url: Qt.resolvedUrl('MainPage.qml'), title: qsTr(''), showNavBar:true,hideBackBtn: true}
    })
    initialPage: 'main'
}

