import QtQuick 2.0

Image {
    width: 855
    height: 475
    source: "qrc:/clock/images/clock/Countdown.gif"

    Timer {
        interval: 60000; running: true; repeat: true;
        onTriggered: countdown()
    }

    property int weeks: 4
    property int days: 5
    property int minutes: 49

    Text {
        text: "Countdown"
        color: "white"
        font.pixelSize: 40
        anchors {right: parent.right; top: parent.top; topMargin: 10; rightMargin: 20 }
    }

    Text { id: countdown_vals
        text: weeks + " Weeks  " + days + " Days  " + minutes + " Min"
        font.pixelSize: 60;
        color: "white"
        x: 100; y: 70

    }

    function countdown(){
        if((minutes + weeks + days) !=0){
            if(minutes==0){
                if(days ==0){
                    weeks = weeks -1;
                    days = 6;
                }
                else {
                days = days - 1;
                minutes = 60;
                }
            } else
              minutes = minutes -1 ;
        }
    }
}
