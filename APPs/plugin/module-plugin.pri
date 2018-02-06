
QT += qml quick
CONFIG += c++11

#INCLUDEPATH += \
#    $$[QT_INSTALL_HEADERS]/QtQml/5.5.0/QtQml/ \
#    $$[QT_INSTALL_HEADERS]/QtCore/5.5.0/ \
#    $$[QT_INSTALL_HEADERS]/QtCore/5.5.0/QtCore


#INCLUDEPATH +=$$PWD/include/

HEADERS += \
    $$PWD/Socket/socketT.h \
    $$PWD/myclient.h


SOURCES += \
    $$PWD/Socket/socketT.cpp \
    $$PWD/myclient.cpp

