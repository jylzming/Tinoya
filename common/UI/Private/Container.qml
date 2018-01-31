import QtQuick 2.3
import QtQuick.Controls 1.2
import 'qrc:/UI/Private' as Private
import 'qrc:/UI/JSLibs/ThreeParts.js' as JSLibs

Item {
    id: root

    property string currentId
    property string initialId

    property bool animating: false
    property var currentAnimation
    property QtObject transitionDelegate
    property string signalPrefix: 'item'

    signal itemRefreshed(string id) // 被刷新
    signal itemBeforeCreated(string id) // 创建之前
    signal itemAfterCreated(string id) // 创建之后
    signal itemCreateError(string id, var err) // 创建时出错

    signal itemReadyShow(string id) // 准备进入
    signal itemShowing(string id) // 进入中
    signal itemShown(string id) // 进入后
    signal itemFirstShown(string id) // 第一次进入后

    signal itemInterrupted(string id, string reason, bool isIn) // 动画中被中断
    signal itemForwardSkipped(string id) // 动画中向前被跳过
    signal itemBackwardSkipped(string id) // 动画中向后被跳过

    signal itemReadyHide(string id) // 准备出去
    signal itemHiding(string id) // 出去中
    signal itemHiden(string id) // 出去后
    signal itemFirstHiden(string id) // 第一次出去后

    signal itemBeforeDestroyed(string id) // 销毁之前
    signal itemAfterDestroyed(string id) // 销毁之后

    onItemRefreshed: __dispatchSignal('refreshed', id)
    onItemAfterCreated: __dispatchSignal('afterCreated', id)

    onItemReadyShow: __dispatchSignal('readyShow', id)
    onItemShowing: __dispatchSignal('showing', id)
    onItemShown: __dispatchSignal('shown', id)
    onItemFirstShown: __dispatchSignal('firstShown', id)

    onItemInterrupted: __dispatchSignal('interrupted', id, [reason, isIn])
    onItemForwardSkipped: __dispatchSignal('forwardSkipped', id)
    onItemBackwardSkipped: __dispatchSignal('backwardSkipped', id)

    onItemReadyHide: __dispatchSignal('readyHide', id)
    onItemHiding: __dispatchSignal('hiding', id)
    onItemHiden: __dispatchSignal('hiden', id)
    onItemFirstHiden: __dispatchSignal('firstHiden', id)

    onItemBeforeDestroyed: __dispatchSignal('beforeDestroyed', id)
    onItemAfterDestroyed: __dispatchSignal('afterDestroyed', id)

    function findById(id) {}
    function findAllById(id) {}
    function findByItem(item) {}
    function findAllByItem(item) {}
    function changeTo(id, opts) {}
    function back(opts) {}

    function __generateId(verifyFn) {
        var id = 'id' + JSLibs._.random(0, 999999);
        if (verifyFn && verifyFn(id)) id = __generateId(verifyFn);
        return id;
    }

    function __dispatchSignal(name, id, args) {
        var signal, result = findAllById(id);
        if (result && result.item) {
            signal = result.item[signalPrefix + JSLibs.ucfirst(name)];
            if (signal) signal(args);
        }
    }
}
