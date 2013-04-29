import QtQuick 2.0

Image {
    source: "qrc:/homeauto/images/homeauto/front_door_bg.gif"

    Image {
        x: 100; y: 20
        source: "qrc:/homeauto/images/homeauto/speaker.gif"
    }

    //====--------------
    // Alerts
    //====--------------
    Text{
        text: " - Alerts -"
        font.pixelSize: 30
        color: "white"
        x: 500; y: 20;
    }
    Rectangle {
        width: 300
        color: "lightgrey"
        x: 450; y: 55
    }
    ListModel { id: alerts_model
        ListElement{
            content: "Someone Knocked"
            time: "1:40pm"
        }
        ListElement{
            content: "Door Locked"
            time: "2:00pm"
        }

    }

    ListView { id: alerts
        x: 450; y: 70
        model: alerts_model
        height: 150; width: 450
        clip: true


        delegate {
            Item { id: container
                height: 30
                width: 300
                Text {
                    text: content
                    color: "lightgrey"
                    font.pixelSize: 19
                    x: 00; y: 10
                }
                Text {
                    text: time
                    color: "lightgrey"
                    font.pixelSize: 13
                    x: 220; y: 17
                }
                Rectangle {
                    width: parent.width
                    height: 1
                    anchors.top: container.bottom
                    color: "darkgrey"
                }
            }
        }

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
        var date = new Date;
        highlight.state = ""
        alerts_model.append({
            content: "House Locked Down!",
                                time: "10:30"
        })
        alerts.currentIndex = alerts.count
    }

    function unlock(){
        var date = new Date;
        highlight.state = "unlocked"
        alerts_model.append({
            content: "Front Door Unlocked",
                                time: "10:20"
        })
        alerts.incrementCurrentIndex()

    }

}
