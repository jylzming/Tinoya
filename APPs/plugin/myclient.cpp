#include "myclient.h"

MyClient::MyClient(const QUrl url)
{
    qDebug("myClient init...");
    connect(&m_socket, &QWebSocket::connected, this, &MyClient::onConnected);
    connect(&m_socket, &QWebSocket::disconnected, this, &MyClient::onClosed);
    m_socket.open(QUrl(url));
}

MyClient::~MyClient()
{
    m_socket.close();
}

void MyClient::onConnected(){
    connect(&m_socket, &QWebSocket::textMessageReceived, this, &MyClient::onTextMessageReceived);
}

void MyClient::onClosed(){

}

void MyClient::sendMessage(const QString info){
    m_socket.sendTextMessage(info);
}

void MyClient::onTextMessageReceived(const QString &message){
    qDebug() << "Message Received:" << message;
    emit onReceiveSignal(message);                      //发送信号，表示接收到服务器消息
}

