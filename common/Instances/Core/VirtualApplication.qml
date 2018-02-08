import 'qrc:/UI/Core' as UCore
import 'qrc:/UI/JSLibs/ThreeParts.js' as JSLibs

UCore.VirtualApplication {
    id: root
    pageStack.transitionDelegate: PageTransitionDelegate {}
    pageStack.onItemBeforeCreated: {

    }

    onApplicationAfterCreated: {
        pageStack.itemReadyShow.connect(updateDisplayInfo);
        currentPageChanged.connect(function () {
            var appWindow = multiApplications.appWindow;
            var pageSettings = pages[currentPage];

            // 判断是否隐藏状态栏返回键
            if (appWindow.statusBar){
//                appWindow.statusBar.hideBackBtn = !!pageSettings.hideBackBtn;
//                appWindow.statusBar.btnIsVisiable = pageSettings.btnIsVisiable;
              }

            // 判断是否隐藏导航栏
            multiApplications.showNavBar = !!pageSettings.showNavBar;
        });
    }
    onApplicationReadyShow: {
        currentPage && updateDisplayInfo(currentPage);
        multiApplications.currentApplicationChanged.connect(function handler () {
            multiApplications.currentApplicationChanged.disconnect(handler);

            var appWindow = multiApplications.appWindow;
            var currentApplication = multiApplications.currentApplicationInfo().item;
            if (currentApplication) {
                console.debug("currentApplication.currentPage: ",currentApplication)
                var pageSettings = currentApplication.pages[currentApplication.currentPage];

                if (pageSettings) {
                    // 判断是否隐藏状态栏返回键
                    if (appWindow.statusBar){
                        appWindow.statusBar.hideBackBtn = !!pageSettings.hideBackBtn;
                    }

                    // 判断是否隐藏导航栏
                    multiApplications.showNavBar = !!pageSettings.showNavBar;
                }
            }
        });
    }
    onApplicationShown: focus = true;
    onApplicationHiden: focus = false;

    // 更新显示相关的信息
    function updateDisplayInfo(id) {
        var pageSettings = pages[id];
        var pageInfo = pageStack.findAllById(id);
        var appWindow = multiApplications.appWindow;

        if (pageSettings) {
            // 判断是否隐藏状态栏
            appWindow.hideStatusBar = !!pageSettings.hideStatusBar;
            appWindow.useStatusAnimation = !!pageSettings.useStatusAnimation;

            // 更新状态栏标题，优先级：pageItem.title（页面实例title） > pageSetting.title（页面配置title） > application.title（应用title） > '状态栏'
//            if (appWindow.statusBar) appWindow.statusBar.setTitle(pageInfo.item.title || multiApplications.appTitle || qsTr('状态栏'));

            // 判断是否隐藏状态栏返回键，代码逻辑移至上面
//            if (appWindow.statusBar) appWindow.statusBar.hideBackBtn = !!pageSettings.hideBackBtn;

            // 判断是否隐藏导航栏，代码逻辑移至上面
            multiApplications.showNavBar = !!pageSettings.showNavBar;

            // 重新设置应用大小
//            pageInfo.item.width = xxx; // 目前没有涉及到有修改宽度的情况
            pageInfo.item.height = !pageSettings.showNavBar ? pageStack.height : pageStack.height - multiApplications.navBar.height;
        }
    }

    function createTipDialogAsync(properties, cb) {
        createDialogAsync('qrc:/Instances/Controls/DialogTip.qml', properties, cb);
    }

    function createConfirmDialogAsync(properties, cb) {
        createDialogAsync('qrc:/Instances/Controls/DialogConfirm.qml', properties, cb);
    }

    function createProgressDialogAsync(properties, cb) {
        createDialogAsync('qrc:/Instances/Controls/DialogProgress.qml', properties, cb);
    }
}
