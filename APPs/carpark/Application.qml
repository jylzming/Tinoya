import QtQuick 2.0
import QtQuick 2.3

import 'qrc:/Instances/Core' as ICore
ICore.VirtualApplication {
    pages: ({
           carpark: {url: Qt.resolvedUrl('Carpark.qml'), title: qsTr(''), showNavBar:true,hideBackBtn:true},
           light: { url: Qt.resolvedUrl('qrc:light/Application.qml'), title: qsTr(''), showNavBar:true,hideBackBtn: true}
    })
    initialPage: 'carpark'
}

