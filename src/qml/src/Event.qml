import QtQuick 2.0

Rectangle {
    id: container
    radius: 15
    property bool isEvent
    property int day
    property int month
    property int year

    function checkEvent(){
        if(day==29 && month==3 && year==2013)
        {
            isEvent = true;
            eventTitle.text = "Final Submission"
            description.text = "Submit the final project app before 9:00 AM, along with the updated website."
            reminder.text = "08:00:AM"
        }
        else if(day==3 && month==4 && year==2013){
            isEvent = true;
            eventTitle.text = "Project Presentation"
            description.text = "Prepare the final project presentation for the class on friday."
            reminder.text = "08:00:AM"
        }
        else if(day==10 && month==4 && year==2013){
            isEvent = true;
            eventTitle.text = "Final Exam"
            description.text = "Be prepared for the final exam for this class on friday, and reach exam location 15 min before exam time."
            reminder.text = "06:00:AM"
        }
        else{
            isEvent = false;
        }
        setState();
        return isEvent;
    }

    function setState(){
        if(isEvent){
            container.state = "State1";
        }
        else
            container.state = "";
    }

    //State "" elements

    Rectangle{
        id: rect1
        x: 15
        y: 15
        width: container.width - 2*15
        height: (container.height - 3*15)/2
        radius: 15
        color: "#cccccc"
        Text{
            id: rect1Text
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: 22
            text: "No Event!"
        }
    }
    TextButton{
        id: textButton1
        x: 15
        y: 30+rect1.height
        width: rect1.width
        height: rect1.height
        text: "Add Event"
        textColor: "#666666"
        clickColor: "#bbbbbb"
        hoverColor: "#989898"
        color: "#cccccc"
        onClicked: {container.state = "State2";}
    }

    //State "State1" elements

    Text{
        x: 15
        y: 15
        width: rect1.width
        height: 50
        id: eventTitle
        font.bold: true
        font.underline: true
        font.pixelSize: 22
        text: ""
        opacity: 0
        Behavior on opacity{NumberAnimation{duration: 200; easing: Easing.InQuad}}
    }
    Text{
        x: 15
        y: eventTitle.y + eventTitle.height
        width: rect1.width
        height: 250
        id: description
        font.bold: true
        wrapMode: Text.Wrap
        font.pixelSize: 22
        text: ""
        opacity: 0
        Behavior on opacity{NumberAnimation{duration: 200; easing: Easing.InQuad}}
    }
    Text{
        x: 15
        y: description.y + description.height
        width: rect1.width
        height: 50
        id: reminder
        font.bold: true
        font.underline: true
        font.pixelSize: 22
        text: ""
        opacity: 0

        Behavior on opacity{NumberAnimation{duration: 200; easing: Easing.InQuad}}
    }

    //state "State2" elements

    Text{
        x: 15
        y: 15
        width: 120
        height: 50
        id: eventTitle1
        font.bold: true

        font.pixelSize: 16
        text: "Event Title"
        opacity: 0
        Behavior on opacity{NumberAnimation{duration: 200; easing: Easing.InQuad}}
    }
    Rectangle{
        id: rect2
        x:150
        y:15
        width: rect1.width - x
        height: 50
        opacity: 0
        color: "#dfdfdf"
        radius: 15
        Behavior on opacity{NumberAnimation{duration: 200; easing: Easing.InQuad}}
        TextInput{
            id: titleInput
            anchors.fill: parent
            anchors.margins: 10
            font.bold: true
            font.pixelSize: 16
            wrapMode: Text.Wrap
        }
    }

    Text{
        x: 15
        y: rect2.y+rect2.height+15
        width: 120
        height: 50
        id: description1
        font.bold: true

        font.pixelSize: 16
        text: "Description"
        opacity: 0
        Behavior on opacity{NumberAnimation{duration: 200; easing: Easing.InQuad}}
    }
    Rectangle{
        id: rect3
        x:150
        y:description1.y
        width: rect1.width - x
        height: 250
        opacity: 0
        color: "#dfdfdf"
        radius: 15
        Behavior on opacity{NumberAnimation{duration: 200; easing: Easing.InQuad}}
        TextInput{
            id: descriptionInput
            anchors.fill: parent
            anchors.margins: 10
            font.bold: true
            font.pixelSize: 16
            wrapMode: Text.Wrap
        }
    }
    Text{
        x: 15
        y: rect3.y + rect3.height+15
        width: 250
        height: 50
        id: reminder1
        font.bold: true

        font.pixelSize: 16
        text: "Reminder Time (hh:mm:AM/PM)"
        opacity: 0
        Behavior on opacity{NumberAnimation{duration: 200; easing: Easing.InQuad}}
    }
    Rectangle{
        id: rect4
        x:280
        y: reminder1.y
        width: rect1.width - x
        height: 50
        opacity: 0
        color: "#dfdfdf"
        radius: 15
        Behavior on opacity{NumberAnimation{duration: 200; easing: Easing.InQuad}}
        TextInput{
            id: reminderInput
            anchors.fill: parent
            anchors.margins: 10
            font.bold: true
            font.pixelSize: 16
            wrapMode: Text.Wrap
        }
    }
    ImageButton{
        id: acceptEvent
        imageSource: "images/buttons_Accept.png"
        x: container.width - 50
        y: container.height - 50
        width: 50
        height: 50
        imageHeight: height
        imageWidth: width
        restOpacity: 0.8
        hoverOpacity: 1.0
        clickOpacity: 1.0
        opacity:0
    }
    ImageButton{
        id: cancel
        imageSource: "images/buttons_Close.png"
        x: 0
        y: container.height - 50
        width: 50
        height: 50
        imageHeight: height
        imageWidth: width
        restOpacity: 0.8
        hoverOpacity: 1.0
        clickOpacity: 1.0
        opacity:0
        onClicked: {container.state = "";}
    }

    states:[
        State {
            name: "State1"
            PropertyChanges {
                target: rect1
                opacity: 0
            }
            PropertyChanges {
                target: textButton1
                opacity: 0
            }
            PropertyChanges {
                target: eventTitle
                opacity: 1
            }
            PropertyChanges {
                target: description
                opacity: 1
            }
            PropertyChanges {
                target: reminder
                opacity: 1
            }
        },
        State{
            name: "State2"
            PropertyChanges {
                target: rect1
                opacity: 0
            }
            PropertyChanges {
                target: textButton1
                opacity: 0
            }
            PropertyChanges {
                target: rect2
                opacity: 1
            }
            PropertyChanges {
                target: rect3
                opacity: 1
            }
            PropertyChanges {
                target: rect4
                opacity: 1
            }
            PropertyChanges {
                target: eventTitle1
                opacity: 1
            }
            PropertyChanges {
                target: description1
                opacity: 1
            }
            PropertyChanges {
                target: reminder1
                opacity: 1
            }
            PropertyChanges {
                target: acceptEvent
                opacity: 1
            }
            PropertyChanges {
                target: cancel
                opacity: 1
            }
        }

    ]
}
