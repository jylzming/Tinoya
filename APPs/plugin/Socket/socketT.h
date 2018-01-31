#ifndef PLUGINSOCKET_H
#define PLUGINSOCKET_H

#include <QObject>

class SocketT : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(SocketT)
    Q_PROPERTY(int recvData READ getrecvData NOTIFY recvDataChanged)

public:

    SocketT();
    ~SocketT(void);

public:
    int getrecvData(void) const;

signals:
    void recvDataChanged(int recvData);

public slots:
    void sendData(int data);

private:
    int mrecvdata;
    int msenddata;
};

#endif // PLUGINSOCKET_H

