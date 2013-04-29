//import QtQuick 2.0

//Rectangle {
//    width: 1920
//    height: 1080
//    color: "blue"
//    Rectangle{
//        width: 100
//        height: parent.height
//        color: "tan"
//        anchors.left: parent.left
//        MouseArea{
//            anchors.fill: parent
//            onClicked: main.move_to(mainWindow);
//        }

//    }

//}

import QtQuick 2.0

Rectangle {
    id: fridgePane
    width: 1920
    height: 1080
    color: "#bbbbbb"
//    gradient: Gradient {
//            GradientStop { position: 0.0; color: "#bbbbbb" }
//            GradientStop { position: 1.0; color: "#dddddd" }
//        }
    Rectangle{
            width: 30
            height: parent.height
            color: "tan"
            anchors.left: parent.left
            MouseArea{
                anchors.fill: parent
                onClicked: main.move_to(mainWindow);
            }

        }
    Rectangle{
        id: rectangle1
        x: 30
        y: 20
        width: 1860
        height: 340
        color: "#ffffff"
        radius: 15
        //border.color: "#bbbbbb"
        visible: true
//        TextButton{
//            text: "Button"
//            color: "#ff9900"
//            hoverColor: "#ff6600"
//            clickColor: "#ff3300"
//            onClicked: {fridgePane.state = "State_Notes"}
//        }
        ListModel{
            id: noteModel
            ListElement{imageSource:"images/Post-it-note-transparent.png"; title:"Note 1"; note:"This is a sample Note";                                visibility: 1;  type: "note"}
            ListElement{imageSource:"images/Post-it-note-transparent.png"; title:"Note 2"; note:"Make sure to submit the project app before deadline!"; visibility: 1;  type: "note"}
            ListElement{imageSource:"images/Post-it-note-transparent.png"; title:"Note 3"; note:"Also, do update the site too.";                        visibility: 1;  type: "note"}
        }
        Component{
            id: noteDelegate

//            Image {
//                id: noteImage
//                source: "images/Post-it-note-transparent.png"
//            }
            Rectangle{
                id: noteVal
                width: 150
                height: 150
                z: 2.0
                radius: 15
                opacity: visibility
                Behavior on opacity{
                    NumberAnimation{duration: 200; easing.type: Easing.InOutQuad}
                }

                Image{
                    id: noteImage
                    width: noteVal.width
                    height: noteVal.height
                    source: imageSource
                }
                MouseArea{
                    anchors.fill: noteVal
                    drag.target: noteVal

                    enabled: {
                        if(visibility == 1)
                            return true;
                        else
                            return false;
                    }
                    drag.axis: Drag.XAndYAxis
                    drag.maximumX: rectangle1.width-noteVal.width
                    drag.minimumX: 0
                    drag.maximumY: rectangle1.height-noteVal.height
                    drag.minimumY: 0

                }

                Column{
                    x: 7
                    y: 7
                    width: noteVal.width-x
                    height: noteVal.height-y
                    visible:{
                        if(type == "magnet"){
                            return false;
                        }
                        else{
                            return true;
                        }
                    }

                    Text{
                        id:noteTitle
//                        anchors.left: parent.left
//                        anchors.top: parent.top
                        //anchors.topMargin: 10
                        //anchors.leftMargin: 10
                        text: title
                        font.pixelSize: 16
                        font.bold: true
                        font.underline: true
                    }
                    Text{
                        //y: noteTitle.height
                        id:noteText
                        width: noteVal.width-parent.x
                        height: noteVal.height-parent.y
//                        anchors.left: parent.left
//                        anchors.top: parent.top
                        //anchors.leftMargin: 10
                        wrapMode: Text.Wrap
                        font.pixelSize: 14
                        text: note
                    }
                }
            }
        }

        Repeater{
            id: noteViewRep
            model: noteModel
            delegate: noteDelegate
            anchors.fill: rectangle1

            //orientation: ListView.Horizontal
        }



        Row{
            id: noteState
            width: rectangle1.width
            height: rectangle1.height
            spacing: 30
            Behavior on width {NumberAnimation{duration: 200; easing: Easing.InOutQuad}}
            Behavior on height {NumberAnimation{duration: 200; easing: Easing.InOutQuad}}
            opacity: 0
            Behavior on opacity {NumberAnimation{duration: 200; }}
            Rectangle{
                id: templateSelect
                width: 500

                height: 340
                radius: 15
                ListModel{
                    id: templateModel
                    ListElement{imageSource: "images/Post-it-note-transparent.png"; visibility: 0; type: "note"}
                    ListElement{imageSource: "images/spiderman.jpg"; visibility: 0; type: "magnet"}
                    //ListElement{imageSource: ""; visibility: 0; type: "magnet"}
                }
                Component{
                    id: templateDelegate
                    Rectangle{
                        id: templateRect
                        width: templateSelect.width
                        height: templateSelect.height
                        radius: 15
                        z: 3
                        opacity: visibility
                        Image{
                            id: templateImage
                            source:imageSource
                            anchors.centerIn: parent
                            width: 250
                            height: 250
                        }
                        MouseArea{
                            anchors.centerIn: parent
                            onClicked: {
                                templateView.currentIndex = 1;
                                //templateRect.border.color = ""
                            }
                        }
                    }
                }
                ListView{
                    id: templateView
                    model: templateModel
                    anchors.fill: parent
//                    width: templateSelect.width

//                    height: templateSelect.height-100
                    spacing: 20
                    currentIndex: 0
                    snapMode: ListView.SnapToItem
                    delegate:templateDelegate
                    orientation: ListView.Vertical
                }
            }

            Rectangle{
                id: noteTextInput
                width: rectangle1.width-noteState.spacing - templateSelect.width
                height: rectangle1.height
                radius: 15
                Text{
                    id: labelNoteTitleInput
                    x: 10
                    y: 10
                    width: 130
                    height: 50
                    text: "Title"
                    font.bold: true
                    font.pixelSize: 21
                }
                Text{
                    id: labelNoteTextInput
                    x: 10
                    y: 70
                    width: 130
                    height: 50
                    text: "Note"
                    font.bold: true
                    font.pixelSize: 21
                }
                Rectangle{
                    x: 150
                    y: 10
                    z: 0.3
                    width: noteTextInput.width - x - 10 -50
                    height: 50
                    color: "#dfdfdf"
                    radius: 15
                    TextInput{

                        id: inputnotetitle
                        x: 15
                        y: 0
                        width: parent.width - x
                        height: parent.height
                        z: 1
                        font.pixelSize: 21
                        color: "#000000"
                    }
                }

                Rectangle{
                    id: rectnote2
                    x: 150
                    y: 70
                    z: 0.3
                    width: noteTextInput.width - x - 10 - 50
                    height: noteTextInput.height - y - 10
                    color: "#dfdfdf"
                    radius: 15
                    TextInput{
                        id: inputnotetext
                        x: 15
                        y: 0
                        width: parent.width - x
                        height: parent.height
                        z: 1
                        font.pixelSize: 21
                        color: "#000000"
                    }
                }
            }
        }

        ImageButton{
            id: imb1
            imageSource: "images/buttons_Add.png"
            //opacity: 0
            restOpacity: 0.8
            hoverOpacity: 1.0
            clickOpacity: 0.9
            imageWidth: 50
            imageHeight: 50
            x: rectangle1.width - imb1.width
            y: 0
            onClicked: {
                if(fridgePane.state == "State_Notes")
                {
                    fridgePane.state = "";
                    var i;
                    for(i=0; i<noteModel.count; i++){
                        noteModel.setProperty(i, "visibility", 1);
                    }
                    for(i=0; i<templateModel.count; i++){
                        templateModel.setProperty(i, "visibility", 0);
                    }
                    imageSource = "images/buttons_Add.png";
                }
                else {
                    fridgePane.state = "State_Notes";
                    var i;
                    for(i=0; i<noteModel.count; i++){
                        noteModel.setProperty(i, "visibility", 0);
                    }
                    for(i=0; i<templateModel.count; i++){
                        templateModel.setProperty(i, "visibility", 1);
                    }
                    imageSource = "images/buttons_Close.png";

                }
            }
        }
        ImageButton{
            id: imb2
            imageSource: "images/buttons_Accept.png"
            //opacity: 0
            restOpacity: 0.8
            hoverOpacity: 1.0
            clickOpacity: 0.9
            imageWidth: 50
            imageHeight: 50
            x: rectangle1.width - imb2.width
            y: rectangle1.height - imb2.height
            opacity: 0
            Behavior on opacity {NumberAnimation{duration: 200; }}
            onClicked: {
                noteModel.append({imageSource: templateModel.get(templateView.currentIndex).imageSource,title: inputnotetitle.text, note:inputnotetext.text, visibility: 1, type: templateModel.get(templateView.currentIndex).type});
                var i;
                for(i=0; i<noteModel.count; i++){
                    noteModel.setProperty(i, "visibility", 1);
                }
                for(i=0; i<templateModel.count; i++){
                    templateModel.setProperty(i, "visibility", 0);
                }
                imb1.imageSource = "images/buttons_Add.png";
                fridgePane.state = "";
            }
        }

//        gradient: Gradient {
//                GradientStop { position: 0.0; color: "#e6e6e6" }
//                GradientStop { position: 1.0; color: "#FFFFFF" }
//            }
    }
//    Rectangle{
//        id: rectangle2
//        x: 1410
//        y: 20
//        width: 480
//        height: 340
//        color: "#ffffff"
//        radius: 15
//    }
    Rectangle{

        id: rectangle3
        x: 30
        y: 380
        width: 1860
        height: 680
        color: "#ffffff"
        radius: 15

        property bool initflag : false
//        gradient: Gradient {
//            GradientStop { position: 0.0; color: "#e6e6e6" }
//            GradientStop { position: 1.0; color: "#FFFFFF" }
//            }
        Calendar {
            id: calendar

            width: 1360//Math.min( parent.width, parent.height - dateBar.height) // works on MeeGo and Desktop
            height:640//Math.min( parent.width, parent.height - dateBar.height) // works on MeeGo and Desktop
            xOffset: 50+10
            yOffset: 60+9
            day: new Date().getDate()
            year: new Date().getFullYear()
            month: new Date().getMonth()
            onDayChanged: {
                if(initflag){
                eventforday.day = day;
                //console.log(day);
                eventforday.month = month;
                eventforday.year = year;
                eventforday.checkEvent();}
                else
                    initflag = true;
            }
            //width: ( parent.width > parent.height-dateBar.height ?  parent.height-dateBar.height : parent.width )
            //height: width
//            /onWidthChanged: console.log( width , height  );
        }
        Event{
            id: eventforday
            x: 1240
            y: 0
            width: 620
            height: 680
            day: new Date().getDate()
            month: new Date().getMonth()
            year: new Date().getFullYear()
            isEvent: checkEvent()
        }
    }
    states: [
        State {
            name: "State_Notes"

//            PropertyChanges {
//                target: rectangle1
//                width: 1860
//                height: 1040
//            }

//            PropertyChanges {
//                target: rectangle2
//                opacity: 0
//            }

//            PropertyChanges {
//                target: rectangle3
//                opacity: 0
//            }
            PropertyChanges {
                target: noteState
                opacity: 1
            }
            PropertyChanges{
                target: imb2
                opacity: 1
            }
        },
        State {
            name: "State_Calendar"

            PropertyChanges {
                target: rectangle3
                x: 30
                y: 20
                width: 1860
                height: 1040
            }

            PropertyChanges {
                target: rectangle1
                opacity: 0
            }

//            PropertyChanges {
//                target: rectangle2
//                opacity: 0
//            }
        },
        State{
            name: "State_Notes_Users"
            PropertyChanges {
                target: userViewParent
                height: 50*usersModel.count
            }
            PropertyChanges{
                target: rectangle3
                visible: false
            }
        }

    ]
    transitions: [
        Transition {
            from: "*"
            to: "State_Notes"
//            NumberAnimation { target: rectangle1; property: "width"; duration: 200; easing.type: Easing.InOutQuad }
//            NumberAnimation { target: rectangle1; property: "height"; duration: 200; easing.type: Easing.InOutQuad }
//            NumberAnimation { target: rectangle2; property: "opacity"; duration: 200; easing.type: Easing.InOutQuad }
//            NumberAnimation { target: rectangle3; property: "opacity"; duration: 200; easing.type: Easing.InOutQuad }

        },
        Transition {
            from: "State_Notes"
            to: "*"
//            NumberAnimation { target: rectangle1; property: "width"; duration: 200; easing.type: Easing.InOutQuad }
//            NumberAnimation { target: rectangle1; property: "height"; duration: 200; easing.type: Easing.InOutQuad }
//            NumberAnimation { target: rectangle2; property: "opacity"; duration: 200; easing.type: Easing.InOutQuad }
//            NumberAnimation { target: rectangle3; property: "opacity"; duration: 200; easing.type: Easing.InOutQuad }
        }

    ]
}
