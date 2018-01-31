import QtQuick 2.3

import 'qrc:/Instances/Core' as ICore

ICore.VirtualApplication {
    pages: ({
         main: { url: Qt.resolvedUrl('home.qml'), title: qsTr('主菜单'), showNavBar:true,hideBackBtn: true}
    })
    initialPage: 'main'
}
