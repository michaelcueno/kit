import QtQuick 2.0

Rectangle {
    width: 200
    height: 150
    color: "lightgrey"

    Text{
        id: artist_text
        anchors {horizontalCenter: parent.horizontalCenter; top: parent.top; topMargin:20}
        text: artist
        font.pixelSize: 20
    }
    Text{
        anchors {horizontalCenter: parent.horizontalCenter; top: artist_text.bottom; topMargin: 5 }
        text: name
        font.pixelSize: 17
    }
    MouseArea{
        anchors.fill: parent
        onPressAndHold: remove_me()
        onClicked: load_song(path, img_path);
    }

    Rectangle { id: shade
        visible: false
        anchors.fill: parent
        color: "black"
        opacity: .7
    }

    Rectangle { id: delete_me
        color: "red"
        width: 100
        height: 30
        opacity: .6
        visible: false
        x: 20; y: 30
        Text {
            text: "remove?"
            font.pixelSize: 30
            color: "white"
            anchors.centerIn: parent
        }
        MouseArea { anchors.fill: parent; onClicked: yep(); }
    }

    Rectangle { id: nope
        x: 30; y: 120
        color: "blue"
        opacity: .6
        width: 100
        height: 30
        visible: false
        Text {
            text: "no"
            font.pixelSize: 30
            color: "white"
            anchors.centerIn: parent
        }
        MouseArea { anchors.fill: parent; onClicked: cancel(); }
    }

    Rectangle {
        color: "darkGrey"
        height: parent.height
        width:1
        anchors.right: parent.right
    }


    function remove_me(){
        delete_me.visible = true;
        nope.visible = true;
        shade.visible = true;
    }

    function cancel(){
        delete_me.visible = false;
        nope.visible = false;
        shade.visible = false;
    }

    function yep(){
        queue.remove(this)
    }
}
