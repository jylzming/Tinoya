
include(config.pri)
include(build.pri)


CONFIG += use_translation

include(APPs/home/module-home.pri)
include(APPs/light/module-light.pri)
include(APPs/plugin/module-plugin.pri)

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

use_translation {
    #ๆๅฎ้่ฆๅฝ้ๅ็ๆบๆไปถ
    TRANSLATIONS += translations/Tinoya_en_US.ts

    lupdate_only {
        SOURCES += \
            *.qml
    }

    OTHER_FILES += \
        translations/Tinoya_en_US.ts
}

# Default rules for deployment.
include(deployment.pri)
