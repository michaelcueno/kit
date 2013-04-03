#ifndef CLOCK_H
#define CLOCK_H
#include "globals.h"

class Clock : public QObject
{
    Q_OBJECT
public:
    Clock();
    ~Clock();
};

#endif // CLOCK_H
