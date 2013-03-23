import QtQuick 2.0

Rectangle {
    width: 1920
    height: 1080
    color: "blue"
    Rectangle{
        width: 100
        height: parent.height
        color: "tan"
        anchors.left: parent.left
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(mainWindow);
        }
    }
}
