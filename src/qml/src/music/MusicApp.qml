/****************************************************************************
**
** Copyright (C) 2012 Michael Cueno.
** Contact: mcueno2@uic.edu
**
** This is the main QML file for the Clock application developed for
** User Interface Design (CS422) @ UIC
**
**
****************************************************************************/

import QtQuick 2.0

Item { id: container

    height: 1080;
    width: 1920;

    Text { text: "test"; font.pixelSize: 100; }

    Component.onCompleted: container.state = "hidden"

    Songs { id: songs; x: 100; y: 0}
    Player { id: player; x: 300; y: 800 }
    Visualizer {id: viz; x: 300; y: 200 }
    NextTrack { id: next; x: 300; y: 40 }

    states: [
    State { name: "focused"

            PropertyChanges {
                target: songs; x: 100; y: 0
            }
    },
    State { name: "hidden"

            PropertyChanges {
                target: songs; x: -600; y: -600
            }
    }
    ]
    transitions: Transition {
        PropertyAnimation { properties: "x,y"; easing.type: Easing.Linear }
    }
}
