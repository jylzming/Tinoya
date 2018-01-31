#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/Demos/main.qml")));

#ifdef QMLPLUGINS_PATH
    engine.addImportPath(app.applicationDirPath() +"/../qmlplugins/");
#endif

    return app.exec();
}
