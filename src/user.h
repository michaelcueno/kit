// Might not use this~~~~~
#ifndef USER_H
#define USER_H
#include "globals.h"

class User : public QObject
{
    Q_OBJECT
public:
    User();
    Q_INVOKABLE QString getName();
    Q_INVOKABLE void setName(QString name);

private:

    QString name;

};

#endif // USER_H
