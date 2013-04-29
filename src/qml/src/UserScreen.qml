import QtQuick 2.0

Rectangle {
    id: container
    width: 1920
    height: 1280
    color:"transparent"

    Component.onCompleted: init()

    Flickable
    {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: parent.height + 400
        flickableDirection: Flickable.VerticalFlick

        Component {
            id: delegate
            Item {
                width: 500; height: 200
                scale: PathView.iconScale
                opacity: PathView.iconOpacity
                z: PathView.zIndex
                Column {
                    Image { anchors.horizontalCenter: parent.horizontalCenter; width: 500; height: 200; source: icon }
                }
            }
        }

        Rectangle
        {
            width: parent.width - 250
            height: 200
            anchors.left: parent.left
            anchors.leftMargin: 250
            anchors.top: parent.top
            anchors.topMargin: 50
            color:"transparent"
            Image{
                id:fbIcon
                source: "qrc:/images/userMenu/fb.png"
                anchors.left: parent.left
            }
            Rectangle
            {
                width: parent.width - fbIcon.width*2.5
                height: parent.height
                anchors.right: parent.right
                color:"transparent"
                PathView
                {
                    anchors.fill: parent
                    model: ListModel{
                        ListElement{
                            icon: "qrc:/images/userMenu/likepost.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/friendrequest.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/wallpost.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/likepost.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/friendrequest.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/wallpost.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/likepost.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/friendrequest.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/wallpost.png"
                        }
                    }
                    delegate: delegate
                    path: Path {
                        startX: 0; startY: 100
                        PathAttribute {name: "zIndex"; value: 9}
                        PathAttribute { name: "iconScale"; value: 1.0 }
                        PathAttribute { name: "iconOpacity"; value: 1.0 }
                        PathQuad { x: 0; y: 25; controlX: 1500; controlY: 45 }
                        PathAttribute { name: "zIndex"; value: 0}
                        PathAttribute { name: "iconScale"; value: 0.3 }
                        PathAttribute { name: "iconOpacity"; value: 0.5 }
                        PathQuad { x: 0; y: 100; controlX: -20; controlY: 45 }
                    }
                }
            }
        }

        Rectangle
        {
            width: parent.width - 250
            height: 250
            anchors.left: parent.left
            anchors.leftMargin: 250
            anchors.top: parent.top
            anchors.topMargin: 350
            color:"transparent"
            Image{
                id:rssIcon
                source: "qrc:/images/userMenu/Rss.png"
                anchors.left: parent.left
            }
            Rectangle
            {
                width: parent.width - rssIcon.width*2.5
                height: parent.height
                anchors.right: parent.right
                color:"transparent"
                PathView
                {
                    anchors.fill: parent
                    model: ListModel{
                        ListElement{
                            icon: "qrc:/images/userMenu/gamespotrss.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/onionrss.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/bbcrss.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/gamespotrss.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/onionrss.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/bbcrss.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/gamespotrss.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/onionrss.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/bbcrss.png"
                        }
                    }
                    delegate: delegate
                    path: Path {
                        startX: 0; startY: 100
                        PathAttribute {name: "zIndex"; value: 9}
                        PathAttribute { name: "iconScale"; value: 1.0 }
                        PathAttribute { name: "iconOpacity"; value: 1.0 }
                        PathQuad { x: 0; y: 25; controlX: 1500; controlY: 45 }
                        PathAttribute { name: "zIndex"; value: 0}
                        PathAttribute { name: "iconScale"; value: 0.3 }
                        PathAttribute { name: "iconOpacity"; value: 0.5 }
                        PathQuad { x: 0; y: 100; controlX: -20; controlY: 45 }
                    }
                }
            }
        }

        Rectangle
        {
            width: parent.width - 250
            height: 250
            anchors.left: parent.left
            anchors.leftMargin: 250
            anchors.top: parent.top
            anchors.topMargin: 650
            color:"transparent"
            Image{
                id:twitterIcon
                source: "qrc:/images/userMenu/Twitter.png"
                anchors.left: parent.left
            }
            Rectangle
            {
                width: parent.width - twitterIcon.width*2.5
                height: parent.height
                anchors.right: parent.right
                color:"transparent"
                PathView
                {
                    anchors.fill: parent
                    model: ListModel{
                        ListElement{
                            icon: "qrc:/images/userMenu/tweet1.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/tweet2.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/tweet3.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/tweet1.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/tweet2.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/tweet3.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/tweet1.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/tweet2.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/tweet3.png"
                        }
                    }
                    delegate: delegate
                    path: Path {
                        startX: 0; startY: 100
                        PathAttribute {name: "zIndex"; value: 9}
                        PathAttribute { name: "iconScale"; value: 1.0 }
                        PathAttribute { name: "iconOpacity"; value: 1.0 }
                        PathQuad { x: 0; y: 25; controlX: 1500; controlY: 45 }
                        PathAttribute { name: "zIndex"; value: 0}
                        PathAttribute { name: "iconScale"; value: 0.3 }
                        PathAttribute { name: "iconOpacity"; value: 0.5 }
                        PathQuad { x: 0; y: 100; controlX: -20; controlY: 45 }
                    }
                }
            }
        }
        Rectangle
        {
            width: parent.width - 250
            height: 250
            anchors.left: parent.left
            anchors.leftMargin: 250
            anchors.top: parent.top
            anchors.topMargin: 950
            color:"transparent"
            Image{
                id:emailIcon
                source: "qrc:/images/userMenu/email.png"
                anchors.left: parent.left
            }
            Rectangle
            {
                width: parent.width - emailIcon.width*2.5
                height: parent.height
                anchors.right: parent.right
                color:"transparent"
                PathView
                {
                    anchors.fill: parent
                    model: ListModel{
                        ListElement{
                            icon: "qrc:/images/userMenu/email1.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/email2.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/email3.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/email1.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/email2.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/email3.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/email1.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/email2.png"
                        }
                        ListElement{
                            icon: "qrc:/images/userMenu/email3.png"
                        }
                    }
                    delegate: delegate
                    path: Path {
                        startX: 0; startY: 100
                        PathAttribute {name: "zIndex"; value: 9}
                        PathAttribute { name: "iconScale"; value: 1.0 }
                        PathAttribute { name: "iconOpacity"; value: 1.0 }
                        PathQuad { x: 0; y: 25; controlX: 1500; controlY: 45 }
                        PathAttribute { name: "zIndex"; value: 0}
                        PathAttribute { name: "iconScale"; value: 0.3 }
                        PathAttribute { name: "iconOpacity"; value: 0.5 }
                        PathQuad { x: 0; y: 100; controlX: -20; controlY: 45 }
                    }
                }
            }
        }
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
