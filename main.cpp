#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>

#include "APPs/plugin/Socket/socketT.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    SocketT *mscoket = new SocketT();
    engine.rootContext();
    engine.rootContext()->setContextProperty("ScoketCtl" , mscoket);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
