import QtQuick 2.3
import 'qrc:/UI/Private' as Private
import 'qrc:/UI/Core' as Core

Core.TabView {
    tabStack.transitionDelegate: QtObject {
        id: root

        property Component inFadeOutFade: Private.ContainerTransition {
            PropertyAnimation {
                target: exitItem
                property: "opacity"
                from: 1
                to: 0
                easing.type: Easing.Linear
                duration: 400
            }

            PropertyAnimation {
                target: enterItem
                property: "opacity"
                from: 0
                to: 1
                easing.type: Easing.Linear
                duration: 400
            }
        }

        function getAnimation(inEl, outEl, opts) {
            return inFadeOutFade.createObject(opts.parent || root, {enterItem: inEl.item, exitItem: outEl.item});
        }
    }

    tabStack.onItemBeforeCreated: {

    }
}
