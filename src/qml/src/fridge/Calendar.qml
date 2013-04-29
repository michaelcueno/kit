import QtQuick 2.0
//import com.nokia.symbian 1.0
Item {
    id: calendar
    property int xOffset
    property int yOffset
    property int year
    property int month
    property int day
    property bool initflag
    property color todayColor: "#bfcc00"
    property color eventColor: "#8c8cba"
    property color selected: "#000000"
    initflag: false

    signal dayPicked(variant date)

    Component.onCompleted: updateCalendar()
    onWidthChanged: updateCalendar()
    //onDayChanged: {.day = calendar.day; Event.month = calendar.month; Event.year = calendar.year;Event.checkEvent();}
    onMonthChanged: updateCalendar()
    onYearChanged: updateCalendar()

    function evalMonthTextVal(){
    var m = "";
    switch(calendar.month){
    case 0:
        m = "January";
        break;
    case 1:
        m = "February";
        break;
    case 2:
        m = "March";
        break;
    case 3:
        m = "April";
        break;
    case 4:
        m = "May";
        break;
    case 5:
        m = "June";
        break;
    case 6:
        m = "July";
        break;
    case 7:
        m = "August";
        break;
    case 8:
        m = "September";
        break;
    case 9:
        m = "October";
        break;
    case 10:
        m = "November";
        break;
    case 11:
        m = "December";
        break;
    };
    return m;
}

    Rectangle{
        id: monthText
        x: 260
        y: 0
        width: 360
        height: 60
        radius: 15
        Text{
            id:monthTextVal
            anchors.centerIn: parent
            font.pixelSize: 21
            font.bold: true
            text: evalMonthTextVal()

        }
    }
    Rectangle{
        id: yearText
        x: 730
        y: 0
        width: 250
        height: 60
        radius: 15
        Text{
            id: yearTextVal
            anchors.centerIn: parent
            text: calendar.year

            font.bold: true
            font.pixelSize: 21
        }
    }
    ImageButton{
        id: imb3
        imageSource: "images/buttons_delete.png"
        //opacity: 0
        restOpacity: 0.8
        hoverOpacity: 1.0
        clickOpacity: 0.9
        imageWidth: 50
        imageHeight: 50
        width: 60
        height: 60
        x: 670
        y: 0
        onClicked: {calendar.year -= 1;
        yearTextVal.text = calendar.year;
        calendar.updateCalendar();}
    }
    ImageButton{
        id: imb4
        imageSource: "images/buttons_Add.png"
        //opacity: 0
        restOpacity: 0.8
        hoverOpacity: 1.0
        clickOpacity: 0.9
        imageWidth: 50
        imageHeight: 50
        width: 60
        height: 60
        x: 980
        y: 0
        onClicked: {calendar.year += 1;
            yearTextVal.text = calendar.year;
            calendar.updateCalendar();}
    }

    ImageButton{
        id: imb1
        imageSource: "images/Actions-arrow-left-icon (2).png"
        //opacity: 0
        restOpacity: 0.8
        hoverOpacity: 1.0
        clickOpacity: 0.9
        imageWidth: 50
        imageHeight: 128
        width: 50
        height: 620
        x: 0
        y: 60
        onClicked: {
            if(calendar.month == 0)
                calendar.month = 11;
            else
                calendar.month -= 1;
            monthTextVal.text = calendar.evalMonthTextVal();
            calendar.updateCalendar();}
    }
    ImageButton{
        id: imb2
        imageSource: "images/Actions-arrow-right-icon.png"
        //opacity: 0
        restOpacity: 0.8
        hoverOpacity: 1.0
        clickOpacity: 0.9
        imageWidth: 50
        imageHeight: 128
        width: 50
        height: 620
        x: 1190
        y: 60
        onClicked: {if(calendar.month == 11)
                calendar.month = 0;
            else
                calendar.month += 1;
            monthTextVal.text = calendar.evalMonthTextVal();
            calendar.updateCalendar();}
    }
    function initListModel()
    {
        // Reset ListModel and starting rectangle positions
        // First 7 rectangles are the days text
        listModel.clear();
        for (var i=0; i<49; i++) {
            if (i>6)
                listModel.append({
                                     "dayNumberText": "",
                                     "dayStringText": "",
                                     "grayedCell": true,
                                     "isToday": false,
                                     "isEvent": false,
                                     "isSelected": false,
                                     // Other 2 fancy animations
                                     "xEval": Math.sin( 360/(i+1))* calendar.width/2 + calendar.width/2,
                                     "yEval": Math.cos( 360/(i+1))* calendar.width/2 + calendar.width/2,
//                                     "xEval": ((i % 7)-3.5) * 100+calendar.width/2,
//                                     "yEval": Math.floor(i / 7) * rep.delegateWidth,
//                                     "xEval": Math.random()*1000-500,
//                                     "yEval": Math.random()*1000-500,
                                     "opacityEval": 0,
                                     "scaleEval": 0.4
                                 });
            else
                // This 2012 Jan index-2 always return Sunday
                listModel.append({
                                     "dayNumberText": Qt.formatDate( new Date(2012, 1, i-2), "ddd" ),
                                     "dayStringText": "",
                                     "grayedCell": true,
                                     "isToday": false,
                                     "isEvent": false,
                                     "isSelected": false,
                                     "xEval": ((i % 7)-3.5) * 100+calendar.width/2,
                                     "yEval": height/2,
                                     "opacityEval": 0,
                                     "scaleEval": 0.4
                                 });
        }
    }

    function spreadOutRectangles(itemClicked)
    {
        for (var i=0; i<49; i++) {
            if (i !== itemClicked) {
                rep.model.setProperty(i, "xEval", Math.random()*10000-5000);
                rep.model.setProperty(i, "yEval", Math.random()*10000-5000);
            }
            else {
                rep.model.setProperty(i, "scaleEval", 5);
            }
            rep.model.setProperty(i, "opacityEval", 0 );
        }
    }


    function updateCalendar()
    {
        var startMonthIndex = new Date(year, month, 1).getDate();
        var endMonthIndex = new Date(year, month+1, 0).getDate();
        var startWeekIndex = new Date(year, month, startMonthIndex).getDay();
        var i;

        rep.delegateWidth = 160;
        rep.delegateHeight = 86;
        initListModel();


        // Set text into days rectangles
        for (i=7; i<49; i++) {
            var date = new Date(year, month, i-startWeekIndex-6);
            rep.model.setProperty(i, "dayNumberText", date.getDate() );
            rep.model.setProperty(i, "dayStringText", Qt.formatDate( date, "ddd" ));
            if (i-7 >= startWeekIndex  &&  i-7 < startWeekIndex+endMonthIndex)
                rep.model.setProperty(i, "grayedCell", false);
            if((date.getDate() == 29 && calendar.month == 3 && calendar.year == 2013)||(date.getDate() == 3 && calendar.month == 4 && calendar.year == 2013)||(date.getDate() == 10 && calendar.month == 4 && calendar.year == 2013)){
                rep.model.setProperty(i, "isEvent", true);
            }
            if(date.getDate() == new Date().getDate() && calendar.month == new Date().getMonth() && calendar.year == new Date().getFullYear()){
                rep.model.setProperty(i, "isToday", true);
                rep.model.setProperty(i, "isSelected", true);
            }
        }

        // Final position of rectangles
        for (i=0; i<49; i++) {
            rep.model.setProperty(i, "xEval", (i % 7) * rep.delegateWidth + calendar.xOffset);
            rep.model.setProperty(i, "yEval", Math.floor(i / 7) * rep.delegateHeight -rep.delegateHeight + calendar.yOffset );
            rep.model.setProperty(i, "opacityEval", 1 );
            rep.model.setProperty(i, "scaleEval", 1);
        }
    }

    ListModel {
        id: listModel
    }

    Repeater {
        id: rep
        property real delegateWidth: 160;
        property real delegateHeight: 86;
        width: parent.width
        height: parent.height
        model: listModel
        delegate: Rectangle {
            id: rect
            property int scaleAnimDuration: 100
            x: eval("xEval")
            y: eval("yEval") + rep.delegateHeight
            opacity: eval("opacityEval")
            scale: eval("scaleEval")
            width: rep.delegateWidth
            height: rep.delegateHeight
            color: {
                if (index > 6) {
                    if (eval("grayedCell"))
                        return Qt.rgba(0.8,0.8,0.8, 0.7);
                    if (eval("isToday"))
                        return calendar.todayColor;
                    if (eval("isEvent"))
                        return calendar.eventColor;
                    if (calendar.day === dayNumberText || index%7===0)
                        return Qt.rgba(250,0,0, 0.4);
                    else
                        return Qt.rgba(115,115,115, 0.4);
                }
                else
                    return Qt.rgba(0,100,0, 0.4)
            }
            border.color: (eval("isSelected") && index>6 ? "black" : "#dddddd")
            radius: 15
            enabled: !eval("grayedCell")


            Behavior on x { NumberAnimation { duration: 250; easing.type: Easing.InQuad } }
            Behavior on y { NumberAnimation { duration: 250; easing.type: Easing.InQuad } }
            Behavior on opacity { NumberAnimation { duration: 350; easing.type: Easing.InQuad } }
            Behavior on scale { NumberAnimation { duration: scaleAnimDuration; easing.type: Easing.InQuad } }


            Text {
                id: dayNumber
                anchors.fill: parent
                text: dayNumberText


                font.bold: true
                color: (eval("grayedCell") && index>6 ? "grey" : "black")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 21

            }

            MouseArea {
                anchors.fill: rect
                hoverEnabled: true
                // If scaleAnimDuration=100 the rectangle isn't pressed so we can scale it
                // else the animation made onClicked has not the behavior we want
                onEntered: if (scaleAnimDuration === 100 && index > 6) rect.scale = 1.2
                onExited:  if (scaleAnimDuration === 100 && index > 6) rect.scale = 1
                onClicked: {if(!eval("grayedCell") && index > 6){
                        for(var i=0;i<49;i++){
                            rep.model.setProperty(i, "isSelected", false);
                        }
                        rep.model.setProperty(index, "isSelected", true);
                        calendar.day = eval("dayNumberText");
                    }

//                    if (dayNumber.text !== "" && index > 6) {
//                        scaleAnimDuration = 700
//                        rect.scale = 3;
//                        spreadOutRectangles(index);
//                        dayPicked(new Date(year, month, dayNumber.text) );
//                    }
                }
            }

        }
    }
}

