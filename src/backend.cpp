#include "backend.h"

BackEnd::BackEnd()
{
    homeAutomation = new HomeAutomation();
}

BackEnd::~BackEnd()
{
    delete(homeAutomation);
}

void BackEnd::test(){
    qDebug() << "Hey! this is a test";
}
