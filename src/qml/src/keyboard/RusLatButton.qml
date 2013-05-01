// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

Button {
    id: root

    width: style.but_width_and_half
    fixed: true

    signal sigLanguageSwitch (string lng)

    Text {
        id: rus
        property string type: "ru"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: sep.left
        anchors.rightMargin: 4
        font.pixelSize: root.style.font_size
        color: lang == type ? root.style.col_label_active : root.style.col_label_inactive
        text: "Rus"

        Behavior on color {
            ColorAnimation { duration: 500 }
        }
    }
    Text {
        id: sep
        anchors.centerIn: parent
        font.pixelSize: root.style.font_size
        color: root.style.col_label_def
        text: "/"
    }
    Text {
        id: lat
        property string type: "en"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: sep.right
        anchors.leftMargin: 4
        font.pixelSize: root.style.font_size
        color: lang == type ? root.style.col_label_active : root.style.col_label_inactive
        text: "Lat"

        Behavior on color {
            ColorAnimation { duration: 500 }
        }
    }
    MouseArea {
        anchors.fill: parent
        onPressed:
        {
            if (lang == "en")
            {
                lang = "ru"
            }
            else
            {
                lang = "en"
            }
            root.sigLanguageSwitch(lang)
        }
    }
}
