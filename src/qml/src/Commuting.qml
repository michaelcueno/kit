import QtQuick 2.0
import QtWebKit 3.0

Rectangle
{
    id: container
    width: 1725
    height: 980
    anchors.left: parent.left
    anchors.leftMargin: 100

    Component.onCompleted: init()

    WebView
    {
        anchors.fill: parent
        url: "http://www.google.com/maps"
    }


    states: [
    State { name: "focused"
            PropertyChanges {
                target: container; opacity: 1;
            }
    },
    State { name: "hidden"
            PropertyChanges {
                target: container; opacity: 0;
            }
    }
    ]

    function init()
    {
        container.state = "hidden"
    }


}
