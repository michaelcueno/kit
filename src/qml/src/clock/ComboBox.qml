import QtQuick 2.0

Item { id: container

    Item {
        id:comboBox
        property int selectedItem: 0;
        property alias selectedIndex: listView.currentIndex;
        signal comboClicked;
        width: 180;
        height: 40;
        z:100;
        smooth:true;

        Rectangle {
            id:chosenItem
            width:parent.width;
            height:comboBox.height;
            color: "#b8b8b8"
            smooth:true;
            radius: 6
            Text {
                anchors.centerIn: parent;
                anchors.margins: 8;
                id:chosenItemText
                text: "Beep"
                font.pointSize: 20;
                smooth:true
            }

            MouseArea {
                x: parent.x; y: parent.y
                width: 240; height: 70
                onClicked: {
                    comboBox.state = comboBox.state==="dropDown"?"":"dropDown"
                }
            }
        }

        Rectangle {
            id:dropDown
            width:comboBox.width;
            height:0;
            clip:true;
            anchors.top: chosenItem.bottom;
            anchors.margins: 2;
            color: "lightgray"

            ListView {
                id:listView
                height:500;
                model: SoundsModel{ id: sounds}
                currentIndex: 0
                delegate: Item{
                    width:comboBox.width;
                    height: comboBox.height;

                    Text {
                        text: name
                        anchors.centerIn: parent
                        font.pixelSize: 20
                    }
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            comboBox.state = ""
                            var prevSelection = chosenItemText.text
                            chosenItemText.text = name
                            comboBox.selectedItem = number
                            if(chosenItemText.text != prevSelection){
                                comboBox.comboClicked();
                            }
                            listView.currentIndex = index;
                        }
                    }
                }
            }
        }

        Component {
            id: highlight
            Rectangle {
                width:comboBox.width;
                height:comboBox.height;
                color: "red";
            }
        }

        states: State {
            name: "dropDown";
            PropertyChanges { target: dropDown; height:30*sounds.count }
        }

        transitions: Transition {
            NumberAnimation { target: dropDown; properties: "height"; easing.type: Easing.OutExpo; duration: 1000 }
        }
    }



}
