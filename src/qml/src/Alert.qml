import QtQuick 2.0

Item {

    property string content

    width: 400
    height: 300
    Rectangle {
        x: 0; y: 0
        anchors.fill: parent
        color: "lightsteelblue"
        radius: 20
    }

    Text{ id: alert_txt
        text: "Alert!"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top; anchors.topMargin: 50
        font.pixelSize: 60;
    }

    Text {
        text: content
        anchors.top: alert_txt.bottom; anchors.topMargin: 50
        anchors.left: parent.left; anchors.leftMargin: 30;
        width: 360;
        wrapMode: Text.WordWrap
        font.pixelSize: 40
    }

    Rectangle {
        anchors {left: alert_txt.right; verticalCenter: alert_txt.Center }
        width: 100
        height: 40
        Text { text: "dismiss"
            anchors.centerIn: parent
            font.pixelSize: 20
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {dismiss_alert();}
        }
    }


}
