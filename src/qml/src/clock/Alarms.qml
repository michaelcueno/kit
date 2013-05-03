import QtQuick 2.0

Image {
    width: 855
    height: 475
    source: "qrc:/clock/images/clock/Alarms.gif"

    Text {
        text: "Alarms"
        color: "lightgrey"
        font.pixelSize: 40
        anchors {left: parent.left; top: parent.top; topMargin: 10; leftMargin: 20 }
    }

    Column {
        x: 45; y: 90
        Repeater { id: alarms
            model: alarms_model

            delegate: AlarmDelegate{}
        }
    }

    ListModel { id: alarms_model
        ListElement {
            time: "8:30am"
            name: "Wake UP!!"
        }
        ListElement {
            time: "5:00pm"
            name: "Start Din"
        }
        ListElement {
            time: "3:30pm"
            name: "Record Judge Judy"
        }
        ListElement {
            time : ""
            name : "     Add New Alarm"
        }
    }

    Image {
        x: 420; y: 77
        source: "/home/mike/School/ui-CS422/kit/src/images/clock/alarm_off.png"

        MouseArea {
            anchors {left: parent.left; right: parent.horizontalCenter; top:parent.top; bottom:parent.bottom}
            onClicked: {
                parent.source = "/home/mike/School/ui-CS422/kit/src/images/clock/alarm_on.png"

            }
        }
        MouseArea {
            anchors {left: parent.horizontalCenter; right: parent.right;  top:parent.top; bottom:parent.bottom}
            onClicked: {
                parent.source = "/home/mike/School/ui-CS422/kit/src/images/clock/alarm_off.png"
            }
        }
    }

    Image {
        x: 450; y: 152
        source: "/home/mike/School/ui-CS422/kit/src/images/clock/alarm_off.png"

        MouseArea {
            anchors {left: parent.left; right: parent.horizontalCenter; top:parent.top; bottom:parent.bottom}
            onClicked: {
                parent.source = "/home/mike/School/ui-CS422/kit/src/images/clock/alarm_on.png"

            }
        }
        MouseArea {
            anchors {left: parent.horizontalCenter; right: parent.right;  top:parent.top; bottom:parent.bottom}
            onClicked: {
                parent.source = "/home/mike/School/ui-CS422/kit/src/images/clock/alarm_off.png"
            }
        }
    }


    Image {
        x: 520; y: 227
        source: "/home/mike/School/ui-CS422/kit/src/images/clock/alarm_off.png"

        MouseArea {
            anchors {left: parent.left; right: parent.horizontalCenter; top:parent.top; bottom:parent.bottom}
            onClicked: {
                parent.source = "/home/mike/School/ui-CS422/kit/src/images/clock/alarm_on.png"

            }
        }
        MouseArea {
            anchors {left: parent.horizontalCenter; right: parent.right;  top:parent.top; bottom:parent.bottom}
            onClicked: {
                parent.source = "/home/mike/School/ui-CS422/kit/src/images/clock/alarm_off.png"
            }
        }
    }


}
