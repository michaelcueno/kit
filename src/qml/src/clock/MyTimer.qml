import QtQuick 2.0
import QtMultimedia 5.0

Image {
    width: 855
    height: 475
    source: "qrc:/clock/images/clock/Timer.gif"

    Component.onCompleted: populate_models();

    Text {
        text: "Timer"
        color: "lightgrey"
        font.pixelSize: 40
        anchors {left: parent.left; top: parent.top; topMargin: 10; leftMargin: 20 }
    }

    ComboBox{ id: sounds
        x: 235; y: 383;
        width: 300;
    }

    // Scroll Hours
    Text { x: 127; y: 67;
        text: "Hours"
        color: "white"
        font.pixelSize: 20
    }
    Spinner { id: hours_spinner
        x: 120; y: 112;
        width: 80; height: 200;
        model: hours_model
        delegate: Text { text: hour; font.pixelSize: 50; color: "white"}
        itemHeight: 37
    }

    Text { x: 240; y: 67
        text: "Minutes"
        color: "white"
        font.pixelSize: 20
    }
    Spinner { id: min_spinner
        x:240; y: 112;
        width: 80; height: 200;
        model: minute_model
        delegate: Text { text: min; font.pixelSize: 50; color:"white" }
        itemHeight: 37
    }

    Text { x: 366; y: 67
        text: "Seconds"
        color: "white"
        font.pixelSize: 20
    }
    Spinner { id: sec_spinner
        x:360; y: 112;
        width: 80; height: 200;
        model: second_model
        delegate: Text { text: sec; font.pixelSize: 50; color:"white" }
        itemHeight: 37
    }

    ListModel {id: hours_model }
    ListModel {id: minute_model }
    ListModel {id: second_model }

    Text { id: start_btn
        x: 600; y: 70
        text: "Start"
        font.pixelSize: 50;
        MouseArea {
            anchors.fill: parent
            onClicked: {toggle_countdown();}
        }
        states: [State{
                name: "start"
                PropertyChanges {
                    target: start_btn
                    text: "Start"
                }
            },
            State{
                name: "pause"
                PropertyChanges {
                    target: start_btn
                    text: "Pause"
                }
            }]
    }

    Text { id: clear_btn
        x: 570; y: 200
        text: "Clear"
        rotation: -45
        font.pixelSize: 50;
        MouseArea {
            anchors.fill: parent
            onClicked: {clear(); start_btn.state = "start";}
        }

    }

    MediaPlayer {id: timer_sound
        source: main.root_dir + "sounds/timer.mp3"   // shouldn't be in home auto, i dont feel like recompilinng though
    }

    Timer {id: wait; onTriggered: tick(); }

    function populate_models(){
        for(var i = 0; i < 10; i++){
            hours_model.append({"hour": i});
        }
        for(var i = 0; i < 60; i++){
            minute_model.append({"min": i});
        }
        for(var i = 0; i < 60; i++){
            second_model.append({"sec": i});
        }
    }

    function toggle_countdown(){
        if(start_btn.state == "pause"){
            start_btn.state = "";
            wait.stop();
        }else{
            start_btn.state = "pause"
            wait.start();
        }
    }

    function tick(){
        if(hours_spinner.currentIndex + min_spinner.currentIndex + sec_spinner.currentIndex == 0){
            console.log(timer_sound.source)
            timer_sound.play();
            create_alert("Timer Done")
            start_btn.state = ""
            return
        }
        if(sec_spinner.currentIndex == 0){
            sec_spinner.decrement()
            if(min_spinner.currentIndex == 0){
                min_spinner.decrement()
                if(hours_spinner.currentIndex == 0){
                    console.log("never gets here");
                } else {
                    hours_spinner.decrement();
                }
            } else {
                min_spinner.decrement();
            }
        } else {
            sec_spinner.decrement()
        }
        wait.start();
    }

    function clear(){
        hours_spinner.currentIndex = 0;
        min_spinner.currentIndex = 0;
        sec_spinner.currentIndex = 0;
    }
}
