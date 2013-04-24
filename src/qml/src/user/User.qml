import QtQuick 2.0

Item {

    property string user;

    width: 1720;
    height: 1080-120;

    Text{ id: user_name_text
        text: user;
        font.pixelSize: 100;
        x: 400; y:400;
    }

    states: [
    State { name: "focused"
            PropertyChanges {
                target: user_name_text; opacity: 1;
            }
    },
    State { name: "hidden"
            PropertyChanges {
                target: user_name_text; opacity: 0;
            }
    }
    ]

    transitions: Transition {
        PropertyAnimation { properties: "opacity"; easing.type: Easing.Linear }
    }
}
