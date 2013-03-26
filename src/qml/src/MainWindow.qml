import QtQuick 2.0
import "main"

Rectangle {
    width: 1920
    height: 1080


    // This is not how this should be implemented! SHould belong to the Weather.qml file
    Image { id: weatherbg
        source: "qrc:/weather/images/weather/clear_blue_sky.jpg"
    }


// Temporary navigation panels until we get swipe action to work...
    Rectangle{
        width: 100
        height: parent.height
        color: "tan"
    anchors.right: parent.right
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(fridge);
        }
    }
    Rectangle{
        width: 100
        height: parent.height
        color: "tan"
    anchors.left: parent.left
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(cooking);
        }
    }
    Rectangle{
        width: parent.width
        height: 100
        color: "tan"
        anchors.bottom: parent.bottom
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(cabinets);
        }
    }

    // Data for the blinds
    ListModel { id: users_model
        ListElement {
            name: "Mike Cueno"
        }
        ListElement {
            name: "Matt Pfister"
        }
        ListElement {
            name: "Nisarg"
        }
        ListElement {
            name: "Avinash"
        }
    }

    // The blinds
    ListView { id: users_list_view

        anchors { top: parent.top; horizontalCenter: parent.horizontalCenter;}
        width: 1890
        height: 1000
        model: users_model
        delegate: UserDelegate{}
        clip: true

    }


// The states the app can be in
// Note: these states should be locked unless a user has been selected.
    states: [
    State { name: "center"
            PropertyChanges {
                target: mainWindow; x: 0; y:0
            }
    },
    State { name: "cabinet"
            PropertyChanges {
                target: mainWindow; x: 0; y:-1080
            }
    },
    State { name: "fridge"
            PropertyChanges {
                target: mainWindow; x: -1920; y:0
            }
    },
    State { name: "cooking"
            PropertyChanges {
                target: mainWindow; x: 1920; y:0
            }
    }
    ]

    transitions: Transition {
        PropertyAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
    }


    function test(){console.log("Hey Yo");}

}
