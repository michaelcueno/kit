import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    property string music_source
    width: 1450
    height: 200

    Component.onCompleted: play_btn.state = "play"
    color: "#d9d9d9"

    Rectangle { id: play_stop
        width: 100
        height: 100
        color: "#d9d9d9"
        MouseArea{
            anchors.fill:parent
            onClicked: media_player.play()
        }
    }

    MediaPlayer {
        id: media_player
    }

    Image { id: back_btn
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left;
        anchors.leftMargin: 400;
        source: "qrc:/music/images/music/back_track.png"
        MouseArea {
            anchors.fill: parent
            onClicked: go_back();
        }
    }

    Image { id: play_btn
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: back_btn.right;
        anchors.leftMargin: 40;
        source: "qrc:/music/images/music/play.png"
        MouseArea {
            anchors.fill: parent
            onClicked: play_pause();
        }
    }

    Image { id: pause_btn
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: back_btn.right;
        anchors.leftMargin: 40;
        visible: false
        source: "qrc:/music/images/music/pause.png"
        MouseArea {
            anchors.fill: parent
            onClicked: play_pause();
            enabled: pause_btn.visible
        }

    }
    Image { id: stop_btn
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: play_btn.right;
        anchors.leftMargin: 40;
        source: "qrc:/music/images/music/stop.png"
        MouseArea {
            anchors.fill: parent
            onClicked: stop();
        }
    }

    Image { id: next_btn
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: stop_btn.right;
        anchors.leftMargin: 40;
        source: "qrc:/music/images/music/next_track.png"
        MouseArea {
            anchors.fill: parent
            onClicked: go_next();
        }
    }

 //=====------------
 // Progress bar
 //=====------------
    Rectangle {
        id: position_seek_bg
        height: 10
        width: parent.width
        color: "#48bda8"
        anchors.top: parent.top; anchors.right: parent.right;
    }

    Rectangle {
        id: position_seek_cover
        height: 10
        width: parent.width
        color: "darkgrey"
        anchors.left: seeker.right; anchors.leftMargin: -8
    }

    Image { id: seeker
        source: "qrc:/clock/qml/src/clock/images/center.png"
        anchors.top: parent.top; anchors.topMargin: -6
        x: (media_player.position / media_player.duration) * parent.width
    }
  //=========--------
  // Progress bar end
  //=========--------

  //========----------
  // MetaData
  //========----------

//  Text { id: artist
//      text: media_player.metaData.artist
//  }

    function go_back(){
        console.log("going back")
    }


    function play_pause(){
        if(pause_btn.visible){
            media_player.pause()
            pause_btn.visible = false;
        } else {
            media_player.play()
            pause_btn.visible = true;
        }
    }

    function stop(){
        media_player.stop();
        pause_btn.visible = false;
    }

    function go_next(){
        console.log("going forward")
    }

    function load_song(path){
        media_player.source = path
    }
}
