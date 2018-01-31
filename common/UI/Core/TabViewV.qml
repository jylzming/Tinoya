import QtQuick 2.3
import 'qrc:/UI/Private' as Private
import 'qrc:/UI/Core' as Core

Item {
    id: root
    property var appWindow: null
    property MultiApplications multiApplications: null

    property string tabsPosition: 'left'
    property string tabsItemType: 'button'
    property int count: tabsModel.length

    property alias tabStack: tabStack
    property alias tabs: tabStack.elSettings
    property alias currentTab: tabStack.currentId
    property alias initialTab: tabStack.initialId

    property alias tabsContainer: tabsContainer
    property alias tabsSpacing: tabsContainer.spacing

    property alias tabsContainerImage: tabsContainerImage
    property alias tabsContainerBgSource: tabsContainerImage.source

    property alias tabsRepeater: tabsRepeater
    property alias tabsModel: tabsRepeater.model
    property alias tabsDelegate: tabsRepeater.delegate

    Component.onCompleted: {
        if(tabs) {
            for(var key in tabs) {
                tabs[key].name = key;
                tabs[key].cache = !!tabs[key].cache
            }
        }
        if (initialTab) {
            switchTab(initialTab);
        }
    }

    function switchTab(to,opts) {
        var tabInfo = tabs[to];
        if (!tabInfo) return console.error('VirtualApplication change tab failed: not set tab.');

        opts = opts || {};
        opts.properties = opts.properties || {};
//        opts.properties.name = to;
//        opts.properties.title = opts.title || tabInfo.title;
        opts.properties.tabview = root;
        opts.properties.application = application;

        tabStack.changeTo(to, opts);
    }

    Image {
        id:tabsContainerImage
        anchors.fill: tabsContainer
    }

    Column {
        id: tabsContainer
        anchors.left: tabsPosition === 'left' ? root.left : undefined
        anchors.right: tabsPosition === 'right' ? root.right : undefined
        Repeater {
            id: tabsRepeater
        }
    }

    Core.StackContainer {
        id: tabStack
        height: parent.height
        anchors.left: tabsPosition === 'left' ? tabsContainer.right : root.left
        anchors.right: tabsPosition === 'right'  ? tabsContainer.left : root.right
        signalPrefix: 'tab'
    }
}
