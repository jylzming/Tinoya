#include <QDebug>

#include "socketT.h"

SocketT::SocketT()
{
    qDebug("QObject start up...");
}

SocketT::~SocketT(void)
{

}

int SocketT::getrecvData(void) const
{
    return mrecvdata;
}

void SocketT::sendData(int data)
{
    msenddata = data;
    mrecvdata = msenddata;
    emit recvDataChanged(mrecvdata);
}

