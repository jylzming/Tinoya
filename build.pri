
TEMPLATE = app

QT += qml quick widgets

#定义QML插件的根目录，引擎可查找
DEFINES += QMLPLUGINS_PATH

#!debug {
#    DEFINES -= DEBUG
#    DESTDIR = $${ROOT_DIR}/release/$${PROJECT_NAME}/$${RELEASE_VERSION}/Desktop/apps
#}

#Release模式下引入的库文件
Release:LIBS +=

#Debug模式下引入的库文件
Debug:LIBS +=

#定义宏 （项目，APP）
DEFINES += 

#引入的头文件
INCLUDEPATH += 

#头文件
HEADERS += \
    
#源文件
SOURCES += \
    

#添加QML导入库路径
QML_IMPORT_PATH +=
