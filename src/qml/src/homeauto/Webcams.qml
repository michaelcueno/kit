import QtQuick 2.0

Image {
    source: "qrc:/homeauto/images/homeauto/web_cams_bg.gif"

    ListView { id: webcams

        width: parent.width - 50
        height: parent.height - 20
        x: 40; y: 30
        orientation: ListView.Horizontal
        model: webcams_model

        spacing: 30

        delegate {
            AnimatedImage {
                source: src
                width: 300
                height: 180
            }
        }
    }

    ListModel { id: webcams_model

        ListElement {
            src: "qrc:/homeauto/images/homeauto/fall.gif"
        }
        ListElement {
            src: "qrc:/homeauto/images/homeauto/shower.gif"
        }
        ListElement {
            src: "qrc:/homeauto/images/homeauto/glass.gif"
        }

    }
}
