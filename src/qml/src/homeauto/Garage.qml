import QtQuick 2.0

Item {

    property bool open: false;
    property int countdown: 15

    Image { id: garage
        source: "qrc:/homeauto/images/homeauto/garage.png"
        x: 50; y:130
        width: 400; height: 300
        visible: true
    }
    Image { id: garage_door
        smooth: true
        source: "qrc:/homeauto/images/homeauto/garage_door.jpg"
        x: 70; y:-157
        width: 380; height: 300
        visible: true
        states: State {name: "closed"; PropertyChanges {target: garage_door; y: 137 } }
        transitions: Transition {
            PropertyAnimation { properties: "x,y"; easing.type: Easing.Linear }
        }
    }
    Image{
    source: "qrc:/homeauto/images/homeauto/garage_bg.gif"
    }

    Image { id: garage_door_img
        source: "qrc:/homeauto/images/homeauto/garage_door.gif"
        x: 45; y: 17
    }

    Text {
        text: "- Garage Door -"
        font.pixelSize: 25
        color: "lightgrey"
        x: 550; y: 10;
    }

    Image { id: garage_door_btn
        x: 500; y: 45
        source:"qrc:/homeauto/images/homeauto/garage_btn.gif"
        Image { id: pressed
            anchors.centerIn: parent;
            source: "qrc:/homeauto/images/homeauto/garage_btn_pressed.gif"
            visible: false
        }

        Text { id: push_txt
            text: "PUSH"
            font.pixelSize: 50
            anchors.centerIn: parent
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {pressed.visible = true; push_txt.color = "grey" }
            onReleased: { pressed.visible = false; toggle_garage(); push_txt.color = "white"}
        }
    }

    Text {
        id: countdown_txt
        x: 130; y: 550
        text: "Countdown: " + countdown
        font.pixelSize: 30
        color: "white"
        states:
            State { name: "on"; PropertyChanges {target: countdown_txt; y: 650} }
        transitions: Transition {
            PropertyAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
        }
    }

    Image { id: leave_btn
        source: "qrc:/homeauto/images/homeauto/leave_btn.gif"
        x: 60; y: 500


        Image { id: leave_pressed
            anchors.centerIn: parent;
            source: "qrc:/homeauto/images/homeauto/leave_btn_pressed.gif"
            visible: false
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {leave_pressed.visible = true; leave_txt.color = "grey" }
            onReleased: { leave_pressed.visible = false; leave_start(); leave_txt.color = "white"}
        }
        Text { id: leave_txt
            text: "LEAVE"
            font.pixelSize: 50
            anchors.centerIn: parent
            color: "white"
        }
    }


    Timer { id: timer
        interval: 1000; running: false; repeat: true;
        onTriggered: countdown_tick()
    }

    function toggle_garage(){
        if(open){
            garage_door.state = "closed"
            open = false
        }else{
            garage_door.state = ""
            open = true
        }
    }

    function close(){
        open = false
        garage_door.state = "closed"
    }

    function leave_start(){
        timer.start();
        timer.running = true;
        countdown_txt.state = "on"
        garage_door.state = ""
        open = true
        unlock()
    }

    function countdown_tick(){
        if(countdown == 0){
            lockup();
            timer.stop(); timer.running = false;
            countdown_txt.state = ""
        } else {
            countdown = countdown - 1
        }
    }
}
