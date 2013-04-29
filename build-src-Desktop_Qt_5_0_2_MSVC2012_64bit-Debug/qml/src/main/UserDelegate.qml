import QtQuick 2.0

Item {
    id: usersDelegate
    width: 1900
    height: 200

    Image { id: bg
        source: "qrc:/images/main/wood_plank.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {open(userScreen)}
        }
    }

    Text { id: name_text
        text: name
        font.pixelSize: 60
        color: "black"
        anchors { verticalCenter: parent.verticalCenter; left: bg.left; leftMargin: 180}
    }

    Text { id: email_value_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 670; }
        text: emails
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: email_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 740; }
        text: " Emails"
        font.pixelSize: 50
        color: "grey"
    }

    Text { id: events_value_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1040; }
        text: events
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: event_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1100; }
        text: " Events"
        font.pixelSize: 50
        color: "grey"
    }
    Text { id: feeds_value
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1400; }
        text: feeds
        font.pixelSize: 50
        color: "lightsteelblue"
    }
    Text { id: feeds_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1460; }
        text: " Feeds"
        font.pixelSize: 50
        color: "grey"
    }
    // Default mouse area -> brings to the main user view
}

