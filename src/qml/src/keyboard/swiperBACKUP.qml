import QtQuick 2.0

Item {

    property int index: hours.currentIndex

    width: mainWindow.width
    height: mainWindow.height*(1/4)

    Image { id: bg
        source: "../images/swipe_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    //----------------------------------------------- Hours pathView ----------------------------|

    ListModel { id: hoursModel }

    Component { id: pathDelegate;
        Item {
            width: 90; height: 45
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: hour
                font.pixelSize: 25
                color: "white"
                //rotation: PathView.itemRotationasdf
            }
        }
    }

    PathView { id: hours

        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        model: hoursModel
        delegate: pathDelegate

        path: Path { id: path
            startX: -7000; startY: 16000
         //   PathAttribute { name: "itemRotation"; value: 30 }
            PathQuad { x: mainWindow.width+7000; y: 16000; controlX: mainWindow.width/2; controlY: -15900}
         //   PathAttribute { name: "itemRotation"; value: 30 }
        }
        onCurrentIndexChanged: resetHour(currentIndex)
    }

    //----------------------------------------------------- Day of the week pathView -----------------------|
/*

    ListModel { id: dayModel
        ListElement {
            name: "Monday"
            num: 0;
        }
        ListElement {
            name: "Tuesday"
            num: 1;
        }
        ListElement {
            name: "Wednesday"
            num: 2;
        }
        ListElement {
            name: "Thursday"
            num: 3;
        }
        ListElement {
            name: "Friday"
            num: 4;
        }
        ListElement {
            name: "Saturday"
            num: 5;
        }
        ListElement {
            name: "Sunday"
            num: 6;
        }
    }

    Component { id: dayDelegate;
        Item {
            width: 120; height: 30
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: name
                font.pixelSize: 25
                color: "white"
                // rotation: PathView.itemRotationasdf
            }
        }
    }

    PathView { id: days

        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        model: dayModel
        delegate: dayDelegate

        path: Path { id: dayPath
            startX: 50; startY: 200
        //    PathAttribute { name: "itemRotation"; value: 30 }
            PathQuad { x: mainWindow.width-50; y: 200; controlX: mainWindow.width/2; controlY: 20}
        //    PathAttribute { name: "itemRotation"; value: 30 }
        }
        onCurrentIndexChanged: gotoDay(currentIndex)
    }

    */


    function gotoDay(day){

    }

    function populate_hours(num_hours, cur_hour){

        for( var i=0; i<num_hours; i++ ){
            hoursModel.append({"hour": to_civil_time(i+cur_hour)})
        }
    }

    // TODO : VVERY BUGGY!
    function to_civil_time(offset){

        if(offset <= 12){
            return offset + ":00\n am";
        }else if(offset > 12 && offset < 24){
            offset = offset - 12;
            return offset + ":00\n pm";
        }else{
            offset = offset - 24;
            return to_civil_time(offset);
        }
    }

    function resetHour(x){
        main_stats.setVars(x)
    }
}
