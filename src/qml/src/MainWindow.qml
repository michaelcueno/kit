import QtQuick 2.0
import "main"

Item {
    width: 1920
    height: 1080


    // Temporary navigation panels until we get swipe action to work...

    Image { id: window_sill
        x:0; y:0;
        source: "qrc:/images/main/window-sill.png"
        MouseArea{
            width: 100; height: 1080;
            x: 0; y: 0;
            onClicked: main.move_to(cooking);
        }


        MouseArea{
            width: 1800; height: 120;
            x: 10; y: 960;
            onClicked: main.move_to(cabinets);
        }


        MouseArea{
            width: 100; height: 1080;
            x: 1820; y: 0;
            onClicked: main.move_to(fridge);
        }
    }

    // The blinds
    ListView { id: users_list_view

        width: 1890
        height: 1000
        model: UserModel{}
        delegate: UserDelegate{}
        clip: true

        states: [
        State { name: "down"
                PropertyChanges {
                    target: users_list_view; x: 0; y:0
                }
        },
        State { name: "up"
                PropertyChanges {
                    target: users_list_view; x: 0; y:-1080
                }
        }]
        transitions: Transition {
            PropertyAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
        }
    }

    // Icons
    // Weather Icon
    Image { id: weather_icon
        source: "qrc:/images/main/icons/weather.png"
        anchors {bottom: parent.bottom; bottomMargin:10; left: parent.left; leftMargin: 100; }
        MouseArea {
            anchors.fill: parent
            onClicked: open(weatherApp)   // Function defined in main.qml
        }
    }
    Rectangle { id: clock_icon
        color: "black"
        width: 100; height: 100;
        anchors {bottom: parent.bottom; bottomMargin:10; left: parent.left; leftMargin: 300; }
        MouseArea {
            anchors.fill: parent
            onClicked: open(clockApp)   // Function defined in main.qml
        }
    }
    Rectangle { id: calc_icon
        color: "black"
        width: 100; height: 100;
        anchors {bottom: parent.bottom; bottomMargin:10; left: parent.left; leftMargin: 500; }
        MouseArea {
            anchors.fill: parent
            onClicked: open(calc)   // Function defined in main.qml
        }
    }
    Rectangle { id: music_icon
        color: "black"
        width: 100; height: 100;
        anchors {bottom: parent.bottom; bottomMargin:10; left: parent.left; leftMargin: 700; }
        MouseArea {
            anchors.fill: parent
            onClicked: open(music)   // Function defined in main.qml
        }
    }

    // Pull string (logout thingy)
    Image { id: pullstring
        source: "qrc:/images/main/pullstring.png"
        anchors { top: parent.top; right: parent.right; rightMargin: 20}
        MouseArea {
            anchors.fill: parent
            onClicked: main.logout();
        }
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

    // Debugging tool
    function test(){console.log("Hey Yo");}

    // state parmeter must be either "up" or "down"
    function pull_blinds(state){
        users_list_view.state = state;
    }
}
