import QtQuick 2.0

Rectangle {
    id: container
    width: 1980
    height: 1080
    color: "transparent"

    Component.onCompleted: init()


    Text
    {
        anchors {top: parent.top; topMargin: 150; left: parent.left; leftMargin: 200}
        text: "Change Language"
        font.pixelSize: 50

    }
    Text
    {
        anchors {top: parent.top; topMargin: 210; left: parent.left; leftMargin: 310}
        text: "Click on icons to change"
        font.pixelSize: 20
    }

    Rectangle
    {
        width: 750
        height: 205
        anchors {top: parent.top; topMargin: 100; left: parent.left; leftMargin: 800}
        color: "#C0C0C0"
        border.color: "teal"
        border.width: 5
        ListView{
            id: languageList
            highlight: Rectangle{color: "teal" ;width: 200; height: 200}
            orientation: ListView.Horizontal
            anchors.fill: parent
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            clip: true
            snapMode: ListView.SnapOneItem
            model:ListModel{
                ListElement{
                    name: "English"
                    src: "qrc:/images/settings/english.png"
                }
                ListElement{
                    name: "Spanish"
                    src: "qrc:/images/settings/spanish.png"
                }
                ListElement{
                    name: "Swedish"
                    src: "qrc:/images/settings/swedish.png"
                }
                ListElement{
                    name: "French"
                    src: "qrc:/images/settings/french.png"
                }
                ListElement{
                    name: "German"
                    src: "qrc:/images/settings/german.png"
                }
            }
            delegate: Component{
                Rectangle{
                    height: 200
                    width: 200
                    color: "transparent"
                    Image{
                        width: parent.width
                        height: 150
                        source: src
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text
                    {
                        text: name
                        font.pixelSize: 20
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:{
                            languageList.currentIndex = index
                        }
                    }
                }
            }
        }
    }

    Text
    {
        anchors {top: parent.top; topMargin: 500; left: parent.left; leftMargin: 200}
        text: "Add New User"
        font.pixelSize: 50

    }
    Rectangle
    {
        color: "#C0C0C0"
        border.color: "teal"
        border.width: 5
        anchors {top: parent.top; topMargin: 550; left: parent.left; leftMargin: 800}
        height: 0
        width: 800
        opacity: 0
        ListView
        {
            anchors.fill: parent
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            model:ListModel
            {
                ListElement
                {
                    src: "qrc:/images/userMenu/fb.png"
                }
                ListElement
                {
                    src: "qrc:/images/userMenu/Twitter.png"
                }
                ListElement
                {
                    src: "qrc:/images/userMenu/gmail.png"
                }
            }
            delegate:Component{
                    Rectangle
                    {
                        width: parent.width
                        height: 75
                        Image
                        {
                            width: 100
                            height: 75
                            source: src
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                        }
                        TextInput
                        {
                            anchors.left: parent.left
                            anchors.leftMargin: 100
                        }
                }
            }
        }
    }

    Rectangle
    {
        id: addUser
        width: 800
        height: 50
        color: "#C0C0C0"
        border.color: "teal"
        border.width: 5
        anchors {top: parent.top; topMargin: 500; left: parent.left; leftMargin: 800}
        Text
        {
            id: userLbl
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            height: parent.height
            text: "User name:"
            font.pixelSize: 35
        }
        Rectangle
        {
            width: 550
            height: addUser.height
            anchors.left: parent.left
            anchors.leftMargin: 215
            color: "transparent"
            TextInput
            {
                anchors.fill: parent
                font.pixelSize: 35
                anchors.top: parent.top
                anchors.topMargin: 5
            }
        }
    }

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

    function init()
    {
        container.state = "hidden"
    }
}
