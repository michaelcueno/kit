import QtQuick 2.0
import "main"

Item {
    width: 1920
    height: 1080

    property int indicator: 0

    // Temporary navigation panels until we get swipe action to work...
    Rectangle{ id: move_to_fridge_btn
        width: 100
        height: parent.height
        color: "tan"
        anchors.right: parent.right
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(fridge);
        }
    }
    Rectangle{ id: move_to_cooking_btn
        width: 100
        height: parent.height
        color: "tan"
        anchors.left: parent.left
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(cooking);
        }
    }
    Rectangle{ id: move_to_cabinets_btn
        width: parent.width
        height: 100
        color: "tan"
        anchors.bottom: parent.bottom
        MouseArea{
            anchors.fill: parent
            onClicked: main.move_to(cabinets);
        }
    }

    // The blinds
    Rectangle {
        id: user_one
        width: 1900
        height: 200
        y: 25
        anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"

        Image { id: aBg
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
            anchors { verticalCenter: parent.verticalCenter; left: aBg.left; leftMargin: 180}
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

    Rectangle {
        id: user_two
        width: 1900
        height: 200
        y: 225
        anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"

        Image {id:nBg
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
            anchors { verticalCenter: parent.verticalCenter; left: nBg.left; leftMargin: 180}
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

    Rectangle {
        id: user_three
        width: 1900
        height: 200
        y: 425
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"

        Image {id: miBg
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
            anchors { verticalCenter: parent.verticalCenter; left: miBg.left; leftMargin: 180}
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

    Rectangle {
        id: user_four
        width: 1900
        height: 200
        y: 625
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"

        Image { id: maBg
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
            anchors { verticalCenter: parent.verticalCenter; left: maBg.left; leftMargin: 180}
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
    }

    SequentialAnimation
    {
        id: pull_up_blinds
        PropertyAnimation
        {
            target: user_four
            properties: "y"
            to: 435
            duration: 300
        }
        ParallelAnimation
        {
            PropertyAnimation
            {
                target: user_three
                properties: "y"
                to: 235
                duration: 300
            }
            PropertyAnimation
            {
                target: user_four
                properties: "y"
                to: 245
                duration: 300
            }
        }
        ParallelAnimation
        {
            PropertyAnimation
            {
                target: user_two
                properties: "y"
                to: 35
                duration: 300
            }
            PropertyAnimation
            {
                target: user_three
                properties: "y"
                to: 45
                duration: 300
            }
            PropertyAnimation
            {
                target: user_four
                properties: "y"
                to: 55
                duration: 300
            }
        }
        ParallelAnimation
        {
            PropertyAnimation
            {
                target: user_one
                properties: "y"
                to: -200
                duration: 300
            }
            PropertyAnimation
            {
                target: user_two
                properties: "y"
                to: -200
                duration: 300
            }
            PropertyAnimation
            {
                target: user_three
                properties: "y"
                to: -200
                duration: 300
            }
            PropertyAnimation
            {
                target: user_four
                properties: "y"
                to: -200
                duration: 300
            }
        }
    }

    SequentialAnimation
    {
        id: pull_down_blinds
        PropertyAnimation
        {
            target: user_four
            properties: "y"
            to: 25
            duration: 300
        }
        ParallelAnimation
        {
            PropertyAnimation
            {
                target: user_three
                properties: "y"
                to: 25
                duration: 300
            }
            PropertyAnimation
            {
                target: user_four
                properties: "y"
                to: 225
                duration: 300
            }
        }
        ParallelAnimation
        {
            PropertyAnimation
            {
                target: user_two
                properties: "y"
                to: 25
                duration: 300
            }
            PropertyAnimation
            {
                target: user_three
                properties: "y"
                to: 225
                duration: 300
            }
            PropertyAnimation
            {
                target: user_four
                properties: "y"
                to: 425
                duration: 300
            }
        }
        ParallelAnimation
        {
            PropertyAnimation
            {
                target: user_one
                properties: "y"
                to: 25
                duration: 300
            }
            PropertyAnimation
            {
                target: user_two
                properties: "y"
                to: 225
                duration: 300
            }
            PropertyAnimation
            {
                target: user_three
                properties: "y"
                to: 425
                duration: 300
            }
            PropertyAnimation
            {
                target: user_four
                properties: "y"
                to: 625
                duration: 300
            }
        }
    }

    // Icons
    // Weather Icon
    Image { id: home_icon
        source: "qrc:/images/main/icons/homeIcon.png"
        anchors {bottom: parent.bottom; bottomMargin:15; left: parent.left; leftMargin: 115; }
        MouseArea {
            anchors.fill: parent
            onPressed: {homePressed.start()}
            onReleased: {homeUnpressed.start(); open(screenSaver) }  // Function defined in main.qml
        }
        ParallelAnimation{
            id: homePressed
            PropertyAnimation{target: home_icon; properties: "width"; to: home_icon.width - 10; duration:0}
            PropertyAnimation{target: home_icon; properties: "height"; to: home_icon.height - 10; duration:0}
            PropertyAnimation{target: home_icon; properties: "x"; to: home_icon.x + 20; duration:0}
            PropertyAnimation{target: home_icon; properties: "y"; to: home_icon.y + 20; duration:0}
        }
        ParallelAnimation{
            id: homeUnpressed
            PropertyAnimation{target: home_icon; properties: "width"; to: home_icon.width + 10; duration:0}
            PropertyAnimation{target: home_icon; properties: "height"; to: home_icon.height + 10; duration:0}
            PropertyAnimation{target: home_icon; properties: "x"; to: home_icon.x - 20; duration:0}
            PropertyAnimation{target: home_icon; properties: "y"; to: home_icon.y - 20; duration:0}
        }
    }

    Image { id: weather_icon
        source: "qrc:/images/main/icons/weatherIcon.png"
        anchors {bottom: parent.bottom; bottomMargin:10; left: parent.left; leftMargin: 345; }
        MouseArea {
            anchors.fill: parent
            onPressed: {weatherPressed.start()}
            onReleased: {weatherUnpressed.start(); open(weatherApp) }  // Function defined in main.qml
        }
        ParallelAnimation{
            id: weatherPressed
            PropertyAnimation{target: weather_icon; properties: "width"; to: weather_icon.width - 10; duration:0}
            PropertyAnimation{target: weather_icon; properties: "height"; to: weather_icon.height - 10; duration:0}
            PropertyAnimation{target: weather_icon; properties: "x"; to: weather_icon.x + 20; duration:0}
            PropertyAnimation{target: weather_icon; properties: "y"; to: weather_icon.y + 20; duration:0}
        }
        ParallelAnimation{
            id: weatherUnpressed
            PropertyAnimation{target: weather_icon; properties: "width"; to: weather_icon.width + 10; duration:0}
            PropertyAnimation{target: weather_icon; properties: "height"; to: weather_icon.height + 10; duration:0}
            PropertyAnimation{target: weather_icon; properties: "x"; to: weather_icon.x - 20; duration:0}
            PropertyAnimation{target: weather_icon; properties: "y"; to: weather_icon.y - 20; duration:0}
        }
    }
    Image { id: clock_icon
        source: "qrc:/images/main/icons/clockIcon.png"
        anchors {bottom: parent.bottom; bottomMargin:5; left: parent.left; leftMargin: 525; }
        MouseArea {
            anchors.fill: parent
            MouseArea {
                anchors.fill: parent
                onPressed: {clockPressed.start()}
                onReleased: {clockUnpressed.start(); open(clockApp) }  // Function defined in main.qml
            }
            ParallelAnimation{
                id: clockPressed
                PropertyAnimation{target: clock_icon; properties: "width"; to: clock_icon.width - 10; duration:0}
                PropertyAnimation{target: clock_icon; properties: "height"; to: clock_icon.height - 10; duration:0}
                PropertyAnimation{target: clock_icon; properties: "x"; to: clock_icon.x + 20; duration:0}
                PropertyAnimation{target: clock_icon; properties: "y"; to: clock_icon.y + 20; duration:0}
            }
            ParallelAnimation{
                id: clockUnpressed
                PropertyAnimation{target: clock_icon; properties: "width"; to: clock_icon.width + 10; duration:0}
                PropertyAnimation{target: clock_icon; properties: "height"; to: clock_icon.height + 10; duration:0}
                PropertyAnimation{target: clock_icon; properties: "x"; to: clock_icon.x - 20; duration:0}
                PropertyAnimation{target: clock_icon; properties: "y"; to: clock_icon.y - 20; duration:0}
            }
        }
    }
    Image { id: calc_icon
        source: "qrc:/images/main/icons/calcIcon.png"
        anchors {bottom: parent.bottom; bottomMargin:15; left: parent.left; leftMargin: 800; }
        MouseArea {
            anchors.fill: parent
            onPressed: {calcPressed.start()}

            onReleased: {calcUnpressed.start(); open(calc) }  // Function defined in main.qml
        }
        ParallelAnimation{
            id: calcPressed
            PropertyAnimation{target: calc_icon; properties: "width"; to: calc_icon.width - 10; duration:0}
            PropertyAnimation{target: calc_icon; properties: "height"; to: calc_icon.height - 10; duration:0}
            PropertyAnimation{target: calc_icon; properties: "x"; to: calc_icon.x + 20; duration:0}
            PropertyAnimation{target: calc_icon; properties: "y"; to: calc_icon.y + 20; duration:0}
        }
        ParallelAnimation{
            id: calcUnpressed
            PropertyAnimation{target: calc_icon; properties: "width"; to: calc_icon.width + 10; duration:0}
            PropertyAnimation{target: calc_icon; properties: "height"; to: calc_icon.height + 10; duration:0}
            PropertyAnimation{target: calc_icon; properties: "x"; to: calc_icon.x - 20; duration:0}
            PropertyAnimation{target: calc_icon; properties: "y"; to: calc_icon.y - 20; duration:0}
        }
    }
    Image { id: cooking_icon
        source: "qrc:/images/main/icons/cookingIcon.png"
        anchors {bottom: parent.bottom; bottomMargin:15; left: parent.left; leftMargin: 1000; }
        MouseArea {
            anchors.fill: parent
            onPressed: {cookingPressed.start()}

            onReleased: {cookingUnpressed.start(); move_to(cooking)}  // Function defined in main.qml
        }
        ParallelAnimation{
            id: cookingPressed
            PropertyAnimation{target: cooking_icon; properties: "width"; to: cooking_icon.width - 10; duration:0}
            PropertyAnimation{target: cooking_icon; properties: "height"; to: cooking_icon.height - 10; duration:0}
            PropertyAnimation{target: cooking_icon; properties: "x"; to: cooking_icon.x + 20; duration:0}
            PropertyAnimation{target: cooking_icon; properties: "y"; to: cooking_icon.y + 20; duration:0}
        }
        ParallelAnimation{
            id: cookingUnpressed
            PropertyAnimation{target: cooking_icon; properties: "width"; to: cooking_icon.width + 10; duration:0}
            PropertyAnimation{target: cooking_icon; properties: "height"; to: cooking_icon.height + 10; duration:0}
            PropertyAnimation{target: cooking_icon; properties: "x"; to: cooking_icon.x - 20; duration:0}
            PropertyAnimation{target: cooking_icon; properties: "y"; to: cooking_icon.y - 20; duration:0}
        }
    }
    Image { id: music_icon
        source: "qrc:/images/main/icons/musicIcon.png"
        anchors {bottom: parent.bottom; bottomMargin:15; left: parent.left; leftMargin: 1200; }
        MouseArea {
            anchors.fill: parent
            onPressed: {musicPressed.start()}

            onReleased: {musicUnpressed.start(); }  // Function defined in main.qml
        }
        ParallelAnimation{
            id: musicPressed
            PropertyAnimation{target: music_icon; properties: "width"; to: music_icon.width - 10; duration:0}
            PropertyAnimation{target: music_icon; properties: "height"; to: music_icon.height - 10; duration:0}
            PropertyAnimation{target: music_icon; properties: "x"; to: music_icon.x + 20; duration:0}
            PropertyAnimation{target: music_icon; properties: "y"; to: music_icon.y + 20; duration:0}
        }
        ParallelAnimation{
            id: musicUnpressed
            PropertyAnimation{target: music_icon; properties: "width"; to: music_icon.width + 10; duration:0}
            PropertyAnimation{target: music_icon; properties: "height"; to: music_icon.height + 10; duration:0}
            PropertyAnimation{target: music_icon; properties: "x"; to: music_icon.x - 20; duration:0}
            PropertyAnimation{target: music_icon; properties: "y"; to: music_icon.y - 20; duration:0}
        }
    }

    Image { id: homeAuto_icon
        source: "qrc:/images/main/icons/automationIcon.png"
        anchors {bottom: parent.bottom; bottomMargin:10; left: parent.left; leftMargin: 1450; }
        MouseArea {
            anchors.fill: parent
            onPressed: {homeAutoPressed.start()}

            onReleased: {homeAutoUnpressed.start();}  // Function defined in main.qml
        }
        ParallelAnimation{
            id: homeAutoPressed
            PropertyAnimation{target: homeAuto_icon; properties: "width"; to: homeAuto_icon.width - 10; duration:0}
            PropertyAnimation{target: homeAuto_icon; properties: "height"; to: homeAuto_icon.height - 10; duration:0}
            PropertyAnimation{target: homeAuto_icon; properties: "x"; to: homeAuto_icon.x + 20; duration:0}
            PropertyAnimation{target: homeAuto_icon; properties: "y"; to: homeAuto_icon.y + 20; duration:0}
        }
        ParallelAnimation{
            id: homeAutoUnpressed
            PropertyAnimation{target: homeAuto_icon; properties: "width"; to: homeAuto_icon.width + 10; duration:0}
            PropertyAnimation{target: homeAuto_icon; properties: "height"; to: homeAuto_icon.height + 10; duration:0}
            PropertyAnimation{target: homeAuto_icon; properties: "x"; to: homeAuto_icon.x - 20; duration:0}
            PropertyAnimation{target: homeAuto_icon; properties: "y"; to: homeAuto_icon.y - 20; duration:0}
        }
    }

    Image { id: settings_icon
        source: "qrc:/images/main/icons/settingsIcon.png"
        anchors {bottom: parent.bottom; bottomMargin:10; left: parent.left; leftMargin: 1650; }
        MouseArea {
            anchors.fill: parent
            onPressed: {settingsPressed.start()}

            onReleased: {settingsUnpressed.start(); open(settings) }  // Function defined in main.qml
        }
        ParallelAnimation{
            id: settingsPressed
            PropertyAnimation{target: settings_icon; properties: "width"; to: settings_icon.width - 10; duration:0}
            PropertyAnimation{target: settings_icon; properties: "height"; to: settings_icon.height - 10; duration:0}
            PropertyAnimation{target: settings_icon; properties: "x"; to: settings_icon.x + 20; duration:0}
            PropertyAnimation{target: settings_icon; properties: "y"; to: settings_icon.y + 20; duration:0}
        }
        ParallelAnimation{
            id: settingsUnpressed
            PropertyAnimation{target: settings_icon; properties: "width"; to: settings_icon.width + 10; duration:0}
            PropertyAnimation{target: settings_icon; properties: "height"; to: settings_icon.height + 10; duration:0}
            PropertyAnimation{target: settings_icon; properties: "x"; to: settings_icon.x - 20; duration:0}
            PropertyAnimation{target: settings_icon; properties: "y"; to: settings_icon.y - 20; duration:0}
        }
    }

    // Pull string (logout thingy)
    Image { id: pullstring
        source: "qrc:/images/main/pullstring.png"
        anchors { top: parent.top; right: parent.right; rightMargin: 20}
        MouseArea {
            anchors.fill: parent
            onClicked: main.logout();
        }
    }

    // The states the app can be in
    // Note: these states should be locked unless a user has been selected.
    states: [
    State { name: "center"
            PropertyChanges {
                target: mainWindow; x: 0; y:0
            }
    },
    State { name: "cabinet"
            PropertyChanges {
                target: mainWindow; x: 0; y:-1080
            }
    },
    State { name: "fridge"
            PropertyChanges {
                target: mainWindow; x: -1920; y:0
            }
    },
    State { name: "cooking"
            PropertyChanges {
                target: mainWindow; x: 1920; y:0
            }
    }
    ]

    transitions: Transition {
        PropertyAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
    }

    // Debugging tool
    function test(){console.log("Hey Yo");}

    function pull_blinds(direction)
    {
        if(direction == "up")
        {
            pull_up_blinds.start()
            indicator = 1
        }
        else
        {
            pull_down_blinds.start()
            indicator = 0
        }
    }
}
