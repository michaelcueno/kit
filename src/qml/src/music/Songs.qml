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

    Rectangle { id: alabama_shakes
        width: 280; x:0;
        height: 30
        y: 60
        color: "#474747"
        Text {
            text: "Alabama Shakes"
            font.pixelSize: 18
            color: "white"
            x: 10
        }
        MouseArea {
            anchors.fill: parent
            onClicked: { alabama_shakes_songs.height = (alabama_shakes_songs.height == 0)? 25 * alabama_shakes_songs.count : 0}
        }
    }

    Rectangle { id: black_keys
        width: 280; x:0;
        height: 30
        anchors.top: alabama_shakes_songs.bottom
        color: "#474747"
        Text {
            color: "white"
            text: "The Black Keys"
            font.pixelSize: 18
            x: 10
        }
        MouseArea {
            anchors.fill: parent

        }

    }

    Rectangle { id: jack_white
        width: 280; x:0;
        height: 30
        anchors.top: black_keys.bottom
        color: "#474747"
        Text {
            color: "white"
            text: "Jack White"
            font.pixelSize: 18
            x: 10
        }
        MouseArea {
            anchors.fill: parent
            onClicked: { jack_white_songs.height = (jack_white_songs.height == 0)? 25 * jack_white_songs.count : 0}
        }

    }

    ListView { id: alabama_shakes_songs
        x: 0; y: 90
        width: parent.width
        height: 0
        model: alabama_shakes_songs_model
        delegate: SongDelegate{}
        clip: true
        transitions: Transition {
            PropertyAnimation { target: alabama_shakes_songs; property: "height"; duration: 500; easing.type: Easing.Linear}
        }
    }

    ListView { id: jack_white_songs
        x: 0;
        anchors.top: jack_white.bottom
        width: parent.width
        height: 0
        model: jack_white_songs_model
        delegate: SongDelegate{}
        clip: true
        transitions: Transition {
            PropertyAnimation { target: alabama_shakes_songs; property: "height"; duration: 500; easing.type: Easing.Linear}
        }
    }



    ListModel {
        id: alabama_shakes_songs_model
        ListElement{
            name: "Hold On"
            artist: "Alabama Shakes"
            path: "/home/mike/Music/Alabama_Shakes/01 Hold on.mp3"
            img_path : "/home/mike/Music/Alabama_Shakes/capa.bmp"
        }
        ListElement{
            name: "I Found you"
            artist: "Alabama Shakes"
            path: "/home/mike/Music/Alabama_Shakes/02\ I\ found\ you.mp3"
            img_path : "/home/mike/Music/Alabama_Shakes/capa.bmp"
        }
        ListElement{
            name: "Hang Loose"
            artist: "Alabama Shakes"
            path: "/home/mike/Music/Alabama_Shakes/03\ Hang\ loose.mp3"
            img_path : "/home/mike/Music/Alabama_Shakes/capa.bmp"
        }
        ListElement{
            name: "Rise to The Sun"
            artist: "Alabama Shakes"
            path: "/home/mike/Music/Alabama_Shakes/04\ Rise\ to\ the\ sun.mp3"
            img_path : "/home/mike/Music/Alabama_Shakes/capa.bmp"
        }
        ListElement{
            name: "You Ain't Alone"
            artist: "Alabama Shakes"
            path: "/home/mike/Music/Alabama_Shakes/05\ You\ ain\ t\ alone.mp3"
            img_path : "/home/mike/Music/Alabama_Shakes/capa.bmp"
        }
        ListElement{
            name: "Goin to the Party"
            artist: "Alabama Shakes"
            path: "/home/mike/Music/Alabama_Shakes/06\ Goin\ to\ the\ party.mp3"
            img_path : "/home/mike/Music/Alabama_Shakes/capa.bmp"
        }
        ListElement{
            name: "Heartbreaker"
            artist: "Alabama Shakes"
            path: "/home/mike/Music/Alabama_Shakes/07\ Heartbreaker.mp3"
            img_path : "/home/mike/Music/Alabama_Shakes/capa.bmp"
        }

    }

    ListModel {
        id: jack_white_songs_model
        ListElement{
            name: "Missing Pieces"
            artist: "Jack White"
            path: "/home/mike/Music/Jack_White_Blunderbuss/01\ Missing\ Pieces.mp3"
            img_path : "/home/mike/Music/Jack_White_Blunderbuss/cover.jpg"
        }
        ListElement{
            name: "Sixteen Saltines"
            artist: "Jack White"
            path: "/home/mike/Music/Jack_White_Blunderbuss/02\ Sixteen\ Saltines.mp3"
            img_path : "/home/mike/Music/Jack_White_Blunderbuss/cover.jpg"
        }
        ListElement{
            name: "Freedom at 21"
            artist: "Jack White"
            path: "/home/mike/Music/Jack_White_Blunderbuss/03\ Freedom\ At\ 21.mp3 "
            img_path : "/home/mike/Music/Jack_White_Blunderbuss/cover.jpg"
        }
        ListElement{
            name: "Love Interruption"
            artist: "Jack White"
            path: "/home/mike/Music/Jack_White_Blunderbuss/04\ Love\ Interruption.mp3"
            img_path : "/home/mike/Music/Jack_White_Blunderbuss/cover.jpg"
        }
        ListElement{
            name: "Blunderbuss"
            artist: "Jack White"
            path: "/home/mike/Music/Jack_White_Blunderbuss/05\ Blunderbuss.mp3"
            img_path : "/home/mike/Music/Jack_White_Blunderbuss/cover.jpg"
        }
        ListElement{
            name: "Hypocritical kiss"
            artist: "Jack White"
            path: "/home/mike/Music/Jack_White_Blunderbuss/06\ Hypocritical\ Kiss.mp3"
            img_path : "/home/mike/Music/Jack_White_Blunderbuss/cover.jpg"
        }
        ListElement{
            name: "I should go to sleep"
            artist: "Jack White"
            path: "/home/mike/Music/Jack_White_Blunderbuss/11\ I\ Guess\ I\ Should\ Go\ to\ Sleep.mp3"
            img_path : "/home/mike/Music/Jack_White_Blunderbuss/cover.jpg"
        }
        ListElement{
            name: "Take Me with you"
            artist: "Jack White"
            path: "/home/mike/Music/Jack_White_Blunderbuss/13\ Take\ Me\ With\ You\ When\ You\ Go.mp3"
            img_path : "/home/mike/Music/Jack_White_Blunderbuss/cover.jpg"
        }
    }

    Rectangle {
         color: "#252525"
         height: parent.height
         width: 5
         anchors.left: parent.right
    }

    function unhighlight(){
        alabama_shakes_songs.currentIndex = 0;
        for(var i = 0; i < alabama_shakes_songs.count; i++){
            alabama_shakes_songs.currentItem.state = ""
            alabama_shakes_songs.currentIndex = alabama_shakes_songs.currentIndex + 1
        }
        jack_white_songs.currentIndex = 0;
        for(var i = 0; i < jack_white_songs.count; i++){
            jack_white_songs.currentItem.state = ""
            jack_white_songs.currentIndex = jack_white_songs.currentIndex + 1
        }
    }



}
