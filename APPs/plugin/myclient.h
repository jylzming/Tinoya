#ifndef MYCLIENT_H
#define MYCLIENT_H

#include <QObject>
#include <QQuickItem>
#include <QWebSocket>

class MyClient : public QObject
{
    Q_OBJECT
public:
    explicit MyClient(QObject *parent = nullptr);
    MyClient();
    ~MyClient();

signals:

public slots:
};

#endif // MYCLIENT_H
