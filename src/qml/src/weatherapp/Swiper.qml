import QtQuick 2.0

Item {

    property int index: hours.currentIndex
    property int current_day                        // 0=monday, 1=tuesday ...
    property int static_cur_day                            // Never changes, this is today

    width: container.width
    height: container.height*(1/4)

    Image { id: bg
        source: "qrc:/weather/images/weather/swipe_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ListModel { id: hoursModel }

    Component { id: pathDelegate;
        Item {
            width: 90; height: 45
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: hour
                font.pixelSize: 25
                color: "white"
            }
        }
    }

    PathView { id: hours

        anchors.fill: parent
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        model: hoursModel
        delegate: pathDelegate

        path: Path { id: path
            startX: -8000; startY: 23100
            PathAttribute { name: "itemRotation"; value: 30 }
            PathQuad { x: container.width+8000; y: 23100; controlX: container.width/2; controlY: -23018}
            PathAttribute { name: "itemRotation"; value: 30 }
        }
        onCurrentIndexChanged: resetHour(currentIndex)
    }

    //--------------------------------- DAY BUTTONS -------------------------------------//
    Text { id: today
        text: (container.language==1)?"Today":"Måndag"
        font.pixelSize:25;
        color: (current_day == 0)?"#1afffc":"white"
        x: 710; y:110
        rotation: -9;
        MouseArea {
            anchors.fill: parent
            onClicked: {
                set_day(0);
            }
        }
    }
    Text { id: tomorrow
        text: (container.language==1)?"Tomorrow":"Tisdag"
        font.pixelSize: 25;
        color: (current_day == 1)?"#1afffc":"white"
        x:900; y:97
        rotation: 0;
        MouseArea {
            anchors.fill: parent
            onClicked: {
                set_day(1);
            }
        }
    }
    Text { id: day_after
        text: (container.language==1)?"Day After":"Onsdag"
        font.pixelSize: 25;
        color: (current_day == 2)?"#1afffc":"white"
        x:1120; y: 110
        rotation: 8;
        MouseArea {
            anchors.fill: parent
            onClicked: {
                set_day(2);
            }
        }
    }


    // Used for placement of the cosmic unit
    function set_day(day){
        hours.currentIndex = 24*day;
        re_draw()
    }

    // Loads the hours into the swiper after downloading hourly data set
    function populate_hours(num_hours, cur_hour){

        for( var i=0; i<num_hours; i++ ){
            hoursModel.append({"hour": to_civil_time(i+cur_hour)})
        }
    }

    // Used to convert index (0-240) in the hours data to a readable time
    function to_civil_time(offset){

        if(offset <= 12){
            return offset + ":00\n am";
        }else if(offset > 12 && offset < 25){
            offset = offset - 12;
            return offset + ":00\n pm";
        }else{
            offset = offset - 24;
            return to_civil_time(offset);
        }
    }

    // Update main stats
    function resetHour(x){
        main_stats.setVars(x)
    }

    function clear(){
        hoursModel.clear()
    }
}

