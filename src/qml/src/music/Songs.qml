import QtQuick 2.0

Rectangle {
    width: 200
    height: 960

    Component.onCompleted: init()

    color: "darkgrey"

    ListView {
        id: songs
        model: songs_model
        delegate: SongDelegate{}
    }

    ListModel {
        id: songs_model
        ListElement{
            name: "Hold On"
            artist: "Alabama Shakes"
        }
    }



    function init(){
        // Set default music path

        //music.setPath("/home/mike/Music/Alabama_Shakes")

    }

}
