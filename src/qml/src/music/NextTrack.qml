/**
  Next Track: a queue of tracks to play next, double clicking on songs in Songs list will add them here
  */

import QtQuick 2.0

Rectangle {
    width: 1520
    height: 150

    color: "white"
    Rectangle { id: clear_btn
        x: 50; y: 100
        width: 100
        color: "#252525"
        height: 30
        Text {
            text: "Clear?"
            font.pixelSize: 20
            color: "white"
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: clear_queue();
        }
        states:
            State { name: "on"; PropertyChanges {target: clear_btn; y: 150} }
        transitions: Transition {
            PropertyAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
        }
    }

    Rectangle {
        color: "#252525"
        height: parent.height
        width: 200
    }

    Text {
        text: "   Next\n   Song\n   Queue"
        font.pixelSize: 30
        color: "white"
        y: 15; x: 20
    }

    ListModel { id: queue
    }

    ListView { id: song_queue
        x: 200;
        width: parent.width - 200
        height: parent.height
        orientation: ListView.Horizontal
        model: queue
        delegate: NextSongDelegate{}
        clip: true
    }
    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        color: "#252525"
        height: 9
    }
    Rectangle {
        anchors.top: parent.top
        width: parent.width
        color: "#252525"
        height: 9
    }


    function add(path){
        queue.append(path)
        clear_btn.state = "on"
        console.log(clear_btn.state)
    }

    function next_song(){

    }

    function clear_queue(){
        queue.clear()
        clear_btn.state = ""
    }

}
