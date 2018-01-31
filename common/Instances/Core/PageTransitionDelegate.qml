import QtQuick 2.3
import 'qrc:/UI/Private' as Private

QtObject {
    id: root

    property Component moveLeft: Private.ContainerTransition {
        PropertyAnimation {
            target: enterItem
            property: "x"
            from: enterItem && enterItem.width
            to: 0
            easing.type: Easing.InOutCirc
            duration: 600
        }
        PropertyAnimation {
            target: exitItem
            property: "x"
            from: 0
            to: exitItem && -exitItem.width
            easing.type: Easing.InOutCirc
            duration: 600
        }
        PropertyAnimation {
            target: exitItem
            property: "opacity"
            from: 1
            to: 0
            easing.type: Easing.InOutCirc
            duration: 400
        }
    }

    property Component moveRight: Private.ContainerTransition {
        PropertyAnimation {
            target: enterItem
            property: "x"
            from: enterItem && -enterItem.width
            to: 0
            easing.type: Easing.InOutCirc
            duration: 600
        }
        PropertyAnimation {
            target: exitItem
            property: "x"
            from: 0
            to: exitItem && exitItem.width
            easing.type: Easing.InOutCirc
            duration: 600
        }
        PropertyAnimation {
            target: enterItem
            property: "opacity"
            from: 0
            to: 1
            easing.type: Easing.InOutCirc
            duration: 1000
        }
    }

    function getAnimation(inEl, outEl, opts) {
        var com = opts.isBack ? moveRight : moveLeft;
        return com.createObject(opts.parent || root, {enterItem: inEl.item, exitItem: outEl.item});
    }
}
