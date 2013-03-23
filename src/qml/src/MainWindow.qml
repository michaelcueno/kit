import QtQuick 2.0

Rectangle {
    width: 1920
    height: 1080

    Rectangle{
        width: 100
        height: parent.height
        color: "tan"
    anchors.right: parent.right
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(fridge);
        }
    }
    Rectangle{
        width: 100
        height: parent.height
        color: "tan"
    anchors.left: parent.left
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(cooking);
        }
    }
    Rectangle{
        width: parent.width
        height: 100
        color: "tan"
        anchors.bottom: parent.bottom
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(cabinets);
        }
    }
}
