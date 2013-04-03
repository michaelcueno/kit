// Might not user this !!
#include "user.h"

User::User()
{
}

QString User::getName(){
    return this->name;
}

void User::setName(QString name){
    this->name = name;
}
