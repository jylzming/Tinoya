import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

import 'qrc:/Instances/Core' as ICore
import 'qrc:/Instances/Controls' as IControls

ICore.Window{
    id:window
    multiApplications {
        applications: ({
                           home: { url: Qt.resolvedUrl('home/Application.qml'), title: qsTr('主菜单') },
                           light: { url: Qt.resolvedUrl('light/Application.qml'), title: qsTr('主菜单')}
                       })
        initialApplication: 'home'
    }
}
