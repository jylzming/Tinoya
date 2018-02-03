import QtQuick 2.3
import QtQuick.Window 2.2
import 'qrc:/UI/JSLibs/ThreeParts.js' as JSLibs

Window {
    id: root
    title: '未设置'
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"

    property alias useBg: bgLoader.active
    property alias bgImage: bgLoader.item
    property url bgSource

    Component.onCompleted: {
        JSLibs.initRootItem(root);
    }

    function showBg() {
        if (bgImage) bgImage.visible = true;
    }

    function hideBg() {
        if (bgImage) bgImage.visible = false;
    }

    Loader {
        id: bgLoader
        active: true
        anchors.fill: parent//root
        sourceComponent: Component {
            Image {
                anchors.fill: parent//root
                source: bgSource
            }
        }
    }
}
