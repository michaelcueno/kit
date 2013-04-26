import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    property string music_source
    width: 1520
    height: 200

    Rectangle { id: play_stop
        width: 100
        height: 100
        color: "black"
        MouseArea{
            anchors.fill:parent
            onClicked: media_player.play()
        }
    }

    MediaPlayer {
        id: media_player
        source: "/home/mike/Music/Alabama_Shakes/01 Hold on.mp3"
    }
}
