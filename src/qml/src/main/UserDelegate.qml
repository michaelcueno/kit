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

    Text { id: avinash
        text: "Avinash"
        font.pixelSize: 60
        color: "black"
        anchors { verticalCenter: parent.verticalCenter; left: bg.left; leftMargin: 180}
    }

    Text { id: avinash_email_value_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 670; }
        text: "9"
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: avinash_email_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 740; }
        text: " Emails"
        font.pixelSize: 50
        color: "grey"
    }

    Text { id: avinash_events_value
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1040; }
        text: "54"
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: avinash_event_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1100; }
        text: " Events"
        font.pixelSize: 50
        color: "grey"
    }
    Text { id: avinash_feeds_value
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1400; }
        text: "3"
        font.pixelSize: 50
        color: "lightsteelblue"
    }
    Text { id: avinash_feeds_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1460; }
        text: " Feeds"
        font.pixelSize: 50
        color: "grey"
    }
}

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

    Text { id: nisarg
        text: "Nisarg"
        font.pixelSize: 60
        color: "black"
        anchors { verticalCenter: parent.verticalCenter; left: bg.left; leftMargin: 180}
    }

    Text { id: nisarg_email_value_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 670; }
        text: "9"
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: nisarg_email_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 740; }
        text: " Emails"
        font.pixelSize: 50
        color: "grey"
    }

    Text { id: nisarg_events_value
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1040; }
        text: "54"
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: nisarg_event_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1100; }
        text: " Events"
        font.pixelSize: 50
        color: "grey"
    }
    Text { id: nisarg_feeds_value
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1400; }
        text: "3"
        font.pixelSize: 50
        color: "lightsteelblue"
    }
    Text { id: nisarg_feeds_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1460; }
        text: " Feeds"
        font.pixelSize: 50
        color: "grey"
    }
}

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

    Text { id: mike
        text: "Matthew Pfister"
        font.pixelSize: 60
        color: "black"
        anchors { verticalCenter: parent.verticalCenter; left: bg.left; leftMargin: 180}
    }

    Text { id: mike_email_value_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 670; }
        text: "9"
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: mike_email_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 740; }
        text: " Emails"
        font.pixelSize: 50
        color: "grey"
    }

    Text { id: mike_events_value
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1040; }
        text: "54"
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: mike_event_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1100; }
        text: " Events"
        font.pixelSize: 50
        color: "grey"
    }
    Text { id: mike_feeds_value
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1400; }
        text: "3"
        font.pixelSize: 50
        color: "lightsteelblue"
    }
    Text { id: mike_feeds_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1460; }
        text: " Feeds"
        font.pixelSize: 50
        color: "grey"
    }
}

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

    Text { id: matt
        text: "Matthew Pfister"
        font.pixelSize: 60
        color: "black"
        anchors { verticalCenter: parent.verticalCenter; left: bg.left; leftMargin: 180}
    }

    Text { id: matt_email_value_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 670; }
        text: "9"
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: matt_email_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 740; }
        text: " Emails"
        font.pixelSize: 50
        color: "grey"
    }

    Text { id: matt_events_value
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1040; }
        text: "54"
        font.pixelSize: 50
        color: "lightsteelblue"
    }

    Text { id: matt_event_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1100; }
        text: " Events"
        font.pixelSize: 50
        color: "grey"
    }
    Text { id: matt_feeds_value
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1400; }
        text: "3"
        font.pixelSize: 50
        color: "lightsteelblue"
    }
    Text { id: matt_feeds_text
        // Positioning
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 1460; }
        text: " Feeds"
        font.pixelSize: 50
        color: "grey"
    }
    // Default mouse area -> brings to the main user view
}

