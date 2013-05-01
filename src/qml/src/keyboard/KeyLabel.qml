// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

Text {
    property Style cstyle : undefined
    id: body

    states: [
        State {
            name: "active"
            AnchorChanges {
                target: body
                anchors.left: undefined;
                anchors.top: undefined;
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            PropertyChanges {
                target: body
                color: body.cstyle.col_label_def
                font.pixelSize: body.cstyle.font_size
            }
        },
        State {
            name: "inactive"
            AnchorChanges {
                target: body
                anchors.left: parent.left;
                anchors.top: parent.top;
                anchors.horizontalCenter: undefined
                anchors.verticalCenter: undefined
            }
            PropertyChanges {
                target: body
                anchors.leftMargin: 4
                anchors.topMargin: 4
                color: body.cstyle.col_label_inactive
                font.pixelSize: body.cstyle.font_small_size
            }
        }
    ]

    Behavior on color {
        ColorAnimation { duration: 250 }
    }
    Behavior on font.pixelSize {
        NumberAnimation { duration: 250 }
    }
    transitions: Transition {
        AnchorAnimation { duration: 250 }
    }
}
