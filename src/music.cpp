#include "music.h"

Music::Music()
{
}

QString Music::getNextAudioFile(){
    QDir dir(music_path);
    return music_path;
}
