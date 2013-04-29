import QtQuick 2.0

Image {
    width: 855
    height: 475
    source: "qrc:/clock/images/clock/Stopwatch.gif"

    Text {
        text: "Stopwatch"
        color: "white"
        font.pixelSize: 40
                anchors {right: parent.right; top: parent.top; topMargin: 10; rightMargin: 20 }
    }
}
