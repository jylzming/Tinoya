
include(config.pri)
include(build.pri)

QT += websockets
CONFIG += use_translation

include(APPs/home/module-home.pri)
include(APPs/light/module-light.pri)
include(APPs/plugin/module-plugin.pri)
include(APPs/carpark/module-carpark.pri)

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

use_translation {
    #指定需�国际�的源文件
    TRANSLATIONS += translations/Tinoya_en_US.ts

    lupdate_only {
        SOURCES += \
            *.qml
    }

    OTHER_FILES += \
        translations/Tinoya_en_US.ts
}
QT += core
# Default rules for deployment.
include(deployment.pri)
