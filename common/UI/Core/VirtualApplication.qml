import QtQuick 2.3
import 'qrc:/UI/Private' as Private
import 'qrc:/UI/JSLibs/ThreeParts.js' as JSLibs

Private.Control {
    id: root

    property string appId
    property string appTitle
    property var appWindow: null
    property MultiApplications multiApplications: null

    property alias pageStack: pageStack
    // id, cache, url, com, parent, title
    property alias pages: pageStack.elSettings
    property alias currentPage: pageStack.currentId
    property alias initialPage: pageStack.initialId
    property bool initialPageOnStart: true

    property var initialProperties: ({})

    signal pageStackWillEmpty

    signal applicationRefreshed
    signal applicationAfterCreated
    signal applicationReadyShow
    signal applicationShowing
    signal applicationShown
    signal applicationFirstShown
    signal applicationReadyHide
    signal applicationHiding
    signal applicationHiden
    signal applicationFirstHiden
    signal applicationBeforeDestroyed
    signal applicationAfterDestroyed

    Component.onCompleted: {
        if (pages) {
            // add name property into page object
            var page;
            for (var key in pages) {
                page = pages[key];
                page.name = key;
                page.cache = !!page.cache;
            }
        }

        // show first page
        if (initialPage && initialPageOnStart) {
            changePage(initialPage,initialProperties);
        }
    }

    onApplicationReadyShow: visible = true;
    onApplicationHiden: visible = false;

    function changePage(to, opts) {
        var pageInfo = pages[to];
        if (!pageInfo) return console.error('VirtualApplication change page failed: not set page.');

        opts = opts || {};
        opts.properties = opts.properties || {};
        opts.properties.name = to;
        opts.properties.title = opts.title || pageInfo.title;
        opts.properties.application = root;
        pageStack.changeTo(to, opts);
    }

    function back() {
        var depth = pageStack.depth();

        if (depth > 1) {// show last page
            var pageInfo = pageStack.findByIndex(depth - 2);
            if (pageInfo) changePage(pageInfo.id);
        } else {
            pageStackWillEmpty();
        }
    }

    function currentPageInfo() {
        return pageStack.findById(currentPage);
    }

    function createDialog(creator, properties) {
        var opts = {
            parent: appWindow || (multiApplications && multiApplications.appWindow),
            properties: properties
        };
        var dialog;

        if (typeof creator === 'string') {
            dialog = JSLibs.createComponentObject(creator, opts);
        } else {
            dialog = JSLibs.createObject(creator, opts);
        }

        if (!dialog || typeof dialog === 'string') return console.error('VirtualApplication createDialog err: ', dialog || '');
        if (dialog.autoOpen) dialog.open();
        return dialog;
    }

    function createDialogAsync(creator, properties, cb) {
        var opts = {
            parent: appWindow || (multiApplications && multiApplications.appWindow),
            properties: properties
        };

        var handler = function (err, dialog) {
            if (err) return console.error('VirtualApplication createDialogAsync err: ', err);

            if (dialog) {
                if (dialog.autoOpen) dialog.open();
                if (cb) cb(dialog);
            }
        };

        if (typeof creator === 'string') {
            JSLibs.createComponentObjectAsync(creator, opts, handler);
        } else {
            JSLibs.createObjectAsync(creator, opts, handler);
        }
    }

    StackContainer {
        id: pageStack
        anchors.fill: parent
        signalPrefix: 'page'
    }
}
