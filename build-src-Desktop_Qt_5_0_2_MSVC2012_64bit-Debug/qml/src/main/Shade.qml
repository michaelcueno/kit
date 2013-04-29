import QtQuick 2.0

Rectangle { id: container
    width: 1720;
    height: 960
    color: "grey"
    x: 100; y: -960;

    states: [
    State { name: "focused"
            PropertyChanges {
                target: container; y: 0;
            }
    },
    State { name: "hidden"
            PropertyChanges {
                target: container; y: -960
            }
    }
    ]

    transitions: Transition {
        PropertyAnimation { properties: "x,y"; easing.type: Easing.Linear }
    }
}
