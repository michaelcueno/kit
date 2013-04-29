import QtQuick 2.0

Rectangle {
    id: container
    width: 1980
    height: 1280
    opacity: 0
    color: "#C0C0C0"

    property int index: 1;
    Component.onCompleted: init()

    states: [
    State { name: "focused"
            PropertyChanges {
                target: container; opacity: 1;
            }
    },
    State { name: "hidden"
            PropertyChanges {
                target: container; opacity: 0;
            }
    }
    ]

    Image
    {
        id: screenSaver
        source: "qrc:/images/screensaver/photo1.JPG"
        anchors.fill: parent
        smooth: true
        clip: true
    }
    SequentialAnimation
    {
        id: fadeInOut
        PropertyAnimation
        {
            target: screenSaver
            properties: "opacity"
            to: 0
            duration: 750
        }
        PropertyAnimation
        {
            target: screenSaver
            properties: "source"
            to: "qrc:/images/screensaver/photo" + index + ".JPG"
            duration: 0
        }
        PropertyAnimation
        {
            target: screenSaver
            properties: "opacity"
            to: 1
            duration: 750
        }
    }

    Timer
    {
        interval: 10000
        running: true
        repeat: true
        onTriggered: switchPhoto()
    }

    function switchPhoto()
    {
        if(index == 2)
            index = 1
        else
            index = 2

        fadeInOut.start()
    }

    function init()
    {
        container.state = "hidden"
    }

}
