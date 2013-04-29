import QtQuick 2.0

Image {
    source: "qrc:/homeauto/images/homeauto/front_door_bg.gif"

    Image {
        x: 60; y: 20
        source: "qrc:/homeauto/images/homeauto/speaker.gif"
    }

    Image {
        x: 325; y: 203
        source: "qrc:/homeauto/images/homeauto/front_door.gif"
    }

    Rectangle {id: highlight
        width: 440; height: 210;
        x: 350; y: 226
        radius: 10
        color: "blue"
        opacity: .4
        states: State {name: "unlocked"; PropertyChanges {target: highlight; y: 470 } }
        transitions: Transition {
            PropertyAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
        }
    }

    MouseArea {id: lock_btn
        width: 440; height: 210;
        x: 350; y: 226
        onClicked: lock()
    }
    MouseArea {id: unlock_btn
        width: 440; height: 210;
        x: 350; y: 470
        onClicked: unlock()
    }

    function lock(){
        highlight.state = ""
    }

    function unlock(){
        highlight.state = "unlocked"

    }

}
