import QtQuick 2.0

Image {
    width: 855
    height: 475
    source: "qrc:/clock/images/clock/Stopwatch.gif"

    Text {
        text: "Stopwatch"
        color: "lightgrey"
        font.pixelSize: 40
                anchors {right: parent.right; top: parent.top; topMargin: 10; rightMargin: 20 }
    }

    Image { id: stopwatch
        source: "qrc:/clock/images/clock/stopwatch.png"
        x: 400; y: 60;
        height: 390
        fillMode: Image.PreserveAspectFit
    }
}
