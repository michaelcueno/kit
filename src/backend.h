#ifndef BACKEND_H
#define BACKEND_H

#include "globals.h"
#include "homeautomation.h"

class BackEnd : public QObject
{
    Q_OBJECT

public:
    BackEnd();
    ~BackEnd();

    Q_INVOKABLE void test();
    HomeAutomation *homeAutomation;

};

#endif // BACKEND_H
