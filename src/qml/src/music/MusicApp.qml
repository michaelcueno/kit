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

    Component.onCompleted: container.state = "hidden"

    Songs { id: songs; x: 100; y: 0}
    Visualizer {id: viz; x: 300; y: 100 }
    NextTrack { id: next; x: 400; y: 00 }
    Player { id: player; x: 385; y: 800 }

    states: [
    State { name: "focused"

            PropertyChanges {
                target: songs; x: 100; y: 0
            }
            PropertyChanges {
                target: viz; x: 300; y: 200
            }
            PropertyChanges {
                target: next; x: 400; y: 00
            }
            PropertyChanges {
                target: player; x: 385; y: 800
            }

    },
    State { name: "hidden"

            PropertyChanges {
                target: songs; x: -600; y: -600            
            }
            PropertyChanges {
                target: viz; x: 2000; y: 200
            }
            PropertyChanges {
                target: next; x: 2000; y: 00
            }
            PropertyChanges {
                target: player; x: 2000; y: 800
            }
    }
    ]
    transitions: Transition {
        PropertyAnimation { properties: "x,y"; easing.type: Easing.Linear }
    }

    function add_to_queue(song){
        next.add(song)
        songs.unhighlight();

    }

    function load_song(path, img_path){
        player.load_song(path);
        viz.img_source = img_path;
    }

}
