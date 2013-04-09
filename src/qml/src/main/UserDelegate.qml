import QtQuick 2.0

Item {
    id: usersDelegate
    width: 1900
    height: 200

    Image { id: bg
        source: "qrc:/images/main/wood_plank.png"
    }

    Text { id: name_text
        text: name
        font.pixelSize: 60
        color: "black"
        anchors { verticalCenter: bg.verticalCenter; left: bg.left; leftMargin: 180}
    }
}
