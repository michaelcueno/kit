import QtQuick 2.0

Rectangle {
    id: cookingMain
    width: 1920
    height: 1080
    color: "brown"

    property string alphabet: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    Rectangle{
        id:switchpane
        width: 100
        height: parent.height
        color: "tan"
        anchors.right: parent.right
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(mainWindow);
        }
    }

    Rectangle
    {
        width: 300
        height: 1080
        Text
        {
            id: indexList
            height: 1080
            width: 200
            anchors.right: parent.right
            text: ""
            font.pixelSize: 200
        }
        Flickable
        {
            anchors.fill: parent
            contentHeight: cookingIndex.height
            contentWidth: cookingIndex.width
            flickableDirection: Flickable.VerticalFlick
            Column
            {
                id:cookingIndex
                spacing: 3
                Repeater
                {
                    model: 26
                    Rectangle
                    {
                        Text
                        {
                            id: letter
                            anchors.centerIn: parent
                            text: alphabet.charAt(index)
                            font.pointSize: 15
                            color: "white"
                        }

                        width: 100
                        height: 40
                        color: "black"
                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked: {indexList.text = letter.text}
                        }
                    }
                }
            }
        }
    }
}
