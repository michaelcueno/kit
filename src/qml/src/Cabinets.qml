import QtQuick 2.0

Rectangle {
    width: 1920
    height: 1080
    color: "black"
    Rectangle{
        width: parent.width
        height:100
        color: "tan"
        anchors.top: parent.top
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(mainWindow);
        }
    }
}
