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

    Component.onCompleted: {container.state = "hidden"; }
    Garage { id: garage; }

    FrontDoor { id: frontdoor;}

    Webcams { id: webcams; }

    Thermostat { id: thermo; x: 685; y: 207;}

    states: [
    State { name: "focused"

            PropertyChanges {
                target: garage; x: 100; y: 0
            }
            PropertyChanges {
                target: frontdoor; x: 960; y: 0
            }
            PropertyChanges {
                target: webcams; x: 101; y:720
            }
            PropertyChanges {
                target: thermo;  opacity: 1
            }
    },
    State { name: "hidden"

            PropertyChanges {
                target: garage; x: -900; y: 0
            }
            PropertyChanges {
                target: frontdoor; x: 2000; y:0
            }
            PropertyChanges {
                target: webcams; x: 100; y:1080
            }
            PropertyChanges {
                target: thermo;  opacity: 0
            }
    }
    ]
    transitions: Transition {
        PropertyAnimation { properties: "x,y"; easing.type: Easing.Linear }
        PropertyAnimation { target: thermo; property: "opacity"; easing.type: Easing.Linear}
    }

    function lockup(){
        frontdoor.lock()
        garage.close()
        garage.countdown = 10
        thermo.temp_down()
    }

    function unlock(){
        frontdoor.unlock()
    }

}
