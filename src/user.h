/** This class will hold all the information about a user. It will store user's settings using a
 *  QSettings object and will load users based on username from settings when login is called.
 *  Other widgets that are dependent on a user (calendar, email) will user this classes username
 *  to load their respective data from the settings. ALL DESTRUCTORS SHOULD SAVE TO QOBJECTS. */
#ifndef USER_H
#define USER_H
#include "globals.h"

class User : public QObject
{
    Q_OBJECT
public:
    User();
    Q_INVOKABLE QString getName();
    Q_INVOKABLE void login(QString username);

private:

    QString name;
    QString username;
    QString email;
    QString email_pass;

};

#endif // USER_H
