import QtQuick 2.0

Item {

    property bool open: false;

    Rectangle { id: garage
        color: "black"
        x: 50; y:130
        width: 400; height: 300
        visible: true
    }
    Rectangle { id: garage_door
        smooth: true
        color: "darkgrey"
        x: 50; y:-150
        width: 400; height: 300
        visible: true
        states: State {name: "closed"; PropertyChanges {target: garage_door; y: 130 } }
        transitions: Transition {
            PropertyAnimation { properties: "x,y"; easing.type: Easing.Linear }
        }
    }
    Image{
    source: "qrc:/homeauto/images/homeauto/garage_bg.gif"
    }

    Image { id: garage_door_img
        source: "qrc:/homeauto/images/homeauto/garage_door.gif"
        x: 45; y: 17
    }


    Image { id: garage_door_btn
        x: 500; y: 45
        source:"qrc:/homeauto/images/homeauto/garage_btn.gif"
        Image { id: pressed
            anchors.centerIn: parent;
            source: "qrc:/homeauto/images/homeauto/garage_btn_pressed.gif"
            visible: false
        }

        Text { id: push_txt
            text: "PUSH"
            font.pixelSize: 50
            anchors.centerIn: parent
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {pressed.visible = true; push_txt.color = "grey" }
            onReleased: { pressed.visible = false; toggle_garage(); push_txt.color = "white"}
        }
    }

    function toggle_garage(){
        if(open){
            garage_door.state = "closed"
            open = false
        }else{
            garage_door.state = ""
            open = true
        }
    }
}
