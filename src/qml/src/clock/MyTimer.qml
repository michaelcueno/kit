import QtQuick 2.0

Image {
    width: 855
    height: 475
    source: "qrc:/clock/images/clock/Timer.gif"

    Component.onCompleted: populate_models();

    Text {
        text: "Timer"
        color: "white"
        font.pixelSize: 40
        anchors {left: parent.left; top: parent.top; topMargin: 10; leftMargin: 20 }
    }

    ComboBox{ id: sounds
        x: 235; y: 383;
        width: 300;
    }

    // Scroll Hours
    Spinner { id: hours_spinner
        x: 120; y: 112;
        width: 80; height: 200;
        model: hours_model
        delegate: Text { text: hour; font.pixelSize: 50; color: "white"}
        itemHeight: 37
    }

    Spinner { id: min_spinner
        x:240; y: 112;
        width: 80; height: 200;
        model: minute_model
        delegate: Text { text: min; font.pixelSize: 50; color:"white" }
        itemHeight: 37
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
            onClicked: {countdown(); start_btn.state = "pause" }
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
        text: "Pause"
        rotation: -45
        font.pixelSize: 50;
        MouseArea {
            anchors.fill: parent
            onClicked: {clear(); start_btn.state = "start";}
        }

    }

    Timer {id: wait; onTriggered: countdown(); }

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

    function countdown(){
        if(hours_spinner.currentIndex + min_spinner.currentIndex + sec_spinner.currentIndex == 0){
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
