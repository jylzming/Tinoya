#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QUrl>
#include <QQmlEngine>
#include <QtQml>

#include "APPs/plugin/Socket/socketT.h"
#include "APPs/plugin/myclient.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    //const char *uri, int versionMajor, int versionMinor, const char *qmlName;

    //qmlRegisterType<MyClient>("APPs.plugin.MyClient", 1, 0, "MyClient");
    //qmlRegisterType<MyClient>();
    QQmlApplicationEngine engine;
    SocketT *mscoket = new SocketT();
   // QUrl url = new QUrl("ws://192.168.1.109:777");

    MyClient *myClient = new MyClient(QUrl(QStringLiteral("ws://192.168.1.109:777")));
    engine.rootContext();
    engine.rootContext()->setContextProperty("ScoketCtl" , mscoket);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if(myClient->onConnected())
    myClient->sendMessage("hello this ming!");

    return app.exec();
}
