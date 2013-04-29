import QtQuick 2.0

Item {
    height: 75; width: 400

    Text {
        text: time
        color: "white"
        font.pixelSize: 30
    }

    Text {
        x: 175
        height: 100
        text: name
        color: "white"
        font.pixelSize: 30
    }
}

