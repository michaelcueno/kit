#ifndef MUSIC_H
#define MUSIC_H
#include <QDir>

class Music : public QObject
{
    Q_OBJECT
public:
    Music();
    Q_INVOKABLE QString getNextAudioFile();
    QString music_path;
    Q_INVOKABLE inline void setPath(QString p){music_path = p;}
};

#endif // MUSIC_H
