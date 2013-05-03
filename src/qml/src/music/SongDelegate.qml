import QtQuick 2.0


Rectangle { id: songs_delegate

    width: 200
    height: 25
    color: "#d1d1d1"
    x: 80
    Text{
        text: name
        font.pixelSize: 15
        anchors {left: parent.left; leftMargin: 20 ; topMargin: 10; verticalCenter: parent.verticalCenter}
    }
    states:[
        State {
            name: "selected"
            PropertyChanges {
                target: songs_delegate;
                color: "lightsteelblue"
            }
        }
    ]
    MouseArea{
        anchors.fill: parent
        onPressed: parent.state = "selected"
        onClicked: add_track_to_queue(songs.currentItem);
    }

    Rectangle {
        color: "darkgrey"
        width: 200
        height: 1
        anchors.bottom: parent.bottom
    }

    function add_track_to_queue(){
        add_to_queue(
                    {"artist" : artist,
                     "path" : path,
                     "name" : name,
                     "img_path" : img_path});
    }
}
