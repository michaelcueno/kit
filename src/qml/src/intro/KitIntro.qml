import QtQuick 2.0

Item {
    id: intro_container
    width: 1920
    height: 1080



    Component.onCompleted: kit_intro_animation.start()

    Image { id: real_kitchen
        source: "qrc:/images/Kitchen-Window-Views.jpg"
        visible: true;
    }

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
    }



    SequentialAnimation { id: kit_intro_animation
        running: false;
        NumberAnimation { target: kit_text; property: "opacity"; duration: 1000; easing.type: Easing.linear; to: 1 }
        NumberAnimation { target: kit_detail_txt; property: "opacity"; duration: 1000; easing.type: Easing.linear; to: 1 }
    }

    SequentialAnimation { id: real_kitchen_zoom
        NumberAnimation { target: splash; property: "opacity"; duration: 1000; easing.type: Easing.Linear; to: 0 }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: { intro_container.z = 0; intro_container.visible = false; }
    }
}
