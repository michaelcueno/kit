import QtQuick 2.0

Item {
    y: 0
    property string img_source
    width: 1520
    height: 600
    Image {
        source: img_source
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectFit
    }


}
