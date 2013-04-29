import QtQuick 2.0

Rectangle {
    width: 280
    height: 960

    color: "darkgrey"

    Rectangle { id: library_text
        color: "#252525"
        width: parent.width
        height: 60
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#333333";
            }
            GradientStop {
                position: 1.00;
                color: "#6b6a6a";
            }
        }
        Text {
            text: "  - Library -"
            font.pixelSize: 30
            color: "white"
            y: 15
        }
        anchors.top:parent.top;

    }

    ListView {
        x: 0; y: 60
        width: parent.width
        height: parent.height - 60
        id: songs
        model: songs_model
        delegate: SongDelegate{}
        clip: true
    }

    ListModel {
        id: songs_model
        ListElement{
            name: "Hold On"
            artist: "Alabama Shakes"
            path: "/home/mike/Music/Alabama_Shakes/01 Hold on.mp3"
            img_path : "/home/mike/Music/Alabama_Shakes/capa.bmp"
        }
        ListElement{
            name: "Maggot Brain"
            artist: "Funkadelic"
            path: "/home/mike/Music/Funkadelic - Maggot Brain (1971)/1 - Maggot Brain.mp3"
            img_path: "/home/mike/Music/Funkadelic - Maggot Brain (1971)/folder.jpg"
        }
        ListElement{
            name: "Sixteen Saltines"
            artist: "Jack White"
            path: "/home/mike/Music/Jack White - Blunderbuss [BONUS] [smb]/01 Missing Pieces.mp3"
            img_path: "/home/mike/Music/Jack White - Blunderbuss [BONUS] [smb]/cover.jpg"

        }
    }

    Rectangle {
         color: "#252525"
         height: parent.height
         width: 5
         anchors.left: parent.right
    }


    function unhighlight(){
        songs.currentIndex = 0;
        for(var i = 0; i < songs.count; i++){
            songs.currentItem.state = ""
            songs.currentIndex = songs.currentIndex + 1
        }
    }



}
