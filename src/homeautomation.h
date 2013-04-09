#ifndef HOMEAUTOMATION_H
#define HOMEAUTOMATION_H
#include "globals.h"

class HomeAutomation : public QObject
{
    Q_OBJECT

public:
    HomeAutomation();
  /*  Q_INVOKABLE bool leave(int countdown);
    Q_INVOKABLE bool push_garage_door_button();
    Q_INVOKABLE bool set_thermo(int temp);
    Q_INVOKABLE bool somethign();  */

private:

    int m_curTemp;
    bool m_garageIsOpen;
    int m_thermoState;   // 0: off, 1: heating, 2: cooling
};

#endif // HOMEAUTOMATION_H
