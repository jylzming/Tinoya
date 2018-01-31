import QtQuick 2.3
import 'qrc:/UI/Private' as Private

Private.Control {
    id: root

    property Window appWindow: null
    property alias applicationStack: applicationStack
    // id, cache, url, com, parent, title
    property alias applications: applicationStack.elSettings
    property alias currentApplication: applicationStack.currentId
    property alias initialApplication: applicationStack.initialId
    property bool initialApplicationOnStart: true

    signal applicationStackWillEmpty

    Component.onCompleted: {
        if (applications) {
            // add name property into application object
            for (var key in applications) {
                applications[key].name = key;
                applications[key].cache = !!applications[key].cache;
            }
        }

        // show first application
        if (initialApplication && initialApplicationOnStart) {
            changeApplication(initialApplication);
        }
    }

    /*
     * Add these functions for removing an element of this id from the stack.
    */
    function getApplicationInfo(id) {
        return applicationStack.findById(id);
    }

    function removeApplication(id) {
        var applicationInfo = applications[id];
        if (!applicationInfo) return console.error('MultiApplications remove application failed: not set application.');
        applicationStack.remove(id)
    }


    function changeApplication(to, opts) {
        var applicationInfo = applications[to];
        if (!applicationInfo) return console.error('MultiApplications change application failed: not set application.');

        opts = opts || {};
        opts.properties = opts.properties || {};
        opts.properties.appTitle = opts.title || applicationInfo.title;
        opts.properties.multiApplications = root;
		
        applicationStack.changeTo(to, opts);
    }

    function back() {
        var depth = applicationStack.depth();

        var lastApplicationInfo = applications[currentApplicationInfo().id];
        		
        if (depth > 1) {// show last application
            var applicationInfo = applicationStack.findByIndex(depth - 2);
            if(lastApplicationInfo.immediate)
            {
            	if (applicationInfo) changeApplication(applicationInfo.id,{immediate: lastApplicationInfo.immediate});
            }else{
            	if (applicationInfo) changeApplication(applicationInfo.id);
            }            
        } else {
            applicationStackWillEmpty();
        }
    }

    function currentApplicationInfo() {
        return applicationStack.findById(currentApplication);
    }

    function delApplication(deletePos,deleteCount) {
        return applicationStack.delStack(deletePos,deleteCount);
    }

    function currentApplicationPageInfo() {
        var applicationInfo = currentApplicationInfo();
        var pageInfo;

        if (applicationInfo && applicationInfo.item) {
            pageInfo = applicationInfo.item.currentPageInfo();
        }
        return pageInfo;
    }

    StackContainer {
        id: applicationStack
        anchors.fill: parent
        signalPrefix: 'application'

        onItemAfterCreated: {
            var applicationInfo = findAllById(id);
            // 连接页面栈返回上一页的信号
            if (applicationInfo && applicationInfo.item) {
                applicationInfo.item.pageStackWillEmpty.connect(root.back);
            }
        }
    }
}
