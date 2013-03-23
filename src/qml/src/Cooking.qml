import QtQuick 2.0

Rectangle {
    width: 1920
    height: 1080
    color: "brown"
    Rectangle{
        width: 100
        height: parent.height
        color: "tan"
        anchors.right: parent.right
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(mainWindow);
        }
    }
}
