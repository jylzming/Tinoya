TARGET = Tinoya

ROOT_DIR = $$PWD

#指定生成的应用程序放置的目录
DESTDIR = $${ROOT_DIR}\..\output

#ui_source {
#    RESOURCES += $$PWD/../UI/UI.qrc
#}

#ui_binary {
#    DEFINES += UI_BINARY
#}


## 设置编译模式
CONFIG += ui_source
#!debug {
#    CONFIG -= ui_source
#    CONFIG += ui_binary
#}
RESOURCES += $$PWD/common/Instances/Instances.qrc

ui_source {
    RESOURCES += \
        $$PWD\common\Instances\Instances.qrc
    RESOURCES += $$PWD\common\UI\UI.qrc
}
