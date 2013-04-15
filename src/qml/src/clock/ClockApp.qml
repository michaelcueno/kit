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

    height: 1280;
    width: 1920;

    Component.onCompleted: container.state = "hidden"


    MyTimer { id: myTimer;}

    Countdown { id: countdown }

    Alarms { id: alarms }

    Stopwatch { id: stopwatch }

    Clock { id: clock;}


    states: [
    State { name: "focused"

            PropertyChanges {
                target: myTimer; x: 100; y: 0
            }
            PropertyChanges {
                target: countdown; x: 965; y: 0
            }
            PropertyChanges {
                target: alarms; x: 100; y: 485
            }
            PropertyChanges {
                target: stopwatch; x: 965; y:485
            }
            PropertyChanges {
                target: clock; x: 700; y: 400; visible: true
            }
    },
    State { name: "hidden"

            PropertyChanges {
                target: myTimer; x: -600; y: -600
            }
            PropertyChanges {
                target: countdown; x:1900; y: -600
            }
            PropertyChanges {
                target: alarms; x: -600; y: 1800
            }
            PropertyChanges {
                target: stopwatch; x: 1900; y:1800
            }
            PropertyChanges {
                target: clock; visible: false
            }
    }
    ]
    transitions: Transition {
        PropertyAnimation { properties: "x,y"; easing.type: Easing.Linear }
    }


}
