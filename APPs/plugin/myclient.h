#ifndef MYCLIENT_H
#define MYCLIENT_H

#include <QObject>
#include <QQuickItem>
#include <QWebSocket>
#include <QUrl>

class MyClient : public QObject
{
    Q_OBJECT
public:
    explicit MyClient(const QUrl url);
    ~MyClient();

    void sendMessage(const QString info);

signals:
    void onReceiveSignal(const QString &info);

public slots:
    void onConnected();
    void onClosed();
    void onTextMessageReceived(const QString &message);

private:
    QUrl m_url;
    QWebSocket m_socket;
    QString authString;
};

#endif // MYCLIENT_H
