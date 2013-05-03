import QtQuick 2.0

Item {
    id: intro_container
    width: 1920
    height: 1080



    Component.onCompleted: kit_intro_animation.start()

    Rectangle { id: splash
        anchors.fill: parent
        color: "White"
        opacity: 1;

        Text {id: kit_text
            font.pixelSize: 350
            color: "black"
            text: "KIT"
            anchors.centerIn: parent;
            anchors.verticalCenterOffset: -100
            opacity: 0
        }
        Text {id: kit_detail_txt
            font.pixelSize: 80
            color: "darkgrey"
            text: "Kitchen Interface Technology"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: kit_text.bottom
            opacity: 0
        }
        SequentialAnimation { id: kit_intro_animation
            running: false;
            PropertyAnimation { target: kit_text; property: "opacity"; duration: 1000; easing.type: Easing.linear; to: 1 }
            PropertyAnimation { target: kit_detail_txt; property: "opacity"; duration: 1000; easing.type: Easing.linear; to: 1 }
        }
    }


    MouseArea { id: bring_to_help
        anchors.fill: parent
        enabled: true;
        onClicked: { splash.z = 0; splash.visible = false; go_to_help.running = true; }
    }

    SequentialAnimation { id: go_to_help
        PropertyAnimation { target: mainwindow_help; property: "opacity"; duration: 500; }
        PropertyAnimation { target: mainwindow_help; property: "opacity"; duration: 500; easing.type: Easing.Linear; to: 1 }
    }


    Image { id: mainwindow_help
        source: "/home/mike/School/ui-CS422/kit/src/images/intro/mainwindow.png"
        width: parent.width
        height: parent.height
        opacity: 0;

        MouseArea {
            id: got_it
            x: 1600; y: 0;
            width: 320; height: 200;
            onClicked: {bring_to_help.enabled = false; got_it.enabled = false; next_help.start(); navigation_help.visible = true}
        }
    }


    Image { id: navigation_help
        source: "/home/mike/School/ui-CS422/kit/src/images/intro/nav_help.png"
        opacity: 0;
        visible: false

        MouseArea {
            id: ok_ok
            anchors.fill: parent
            enabled: parent.visible
            onClicked: {ok_ok.enabled = false; intro_container.visible = false; intro_container.z = -1}
        }
    }

    SequentialAnimation {id: next_help
        NumberAnimation { target: mainwindow_help; property: "opacity"; duration: 300; easing.type: Easing.Linear; to: 0 }
        NumberAnimation { target: navigation_help; property: "opacity"; duration: 300; easing.type: Easing.Linear; to: 1 }
    }

}
