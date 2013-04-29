import QtQuick 2.0


Rectangle {
    width: 1920
    height: 1080
    id: cabinetPane
    Component.onCompleted: {cabinetPane.state = "moved"}
    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
    Rectangle{
        id: rectangle1
        x: 328
        y: 118
        z: 2
        width: 1425
        height: 175
        color: "#c2c1c1"
        /*Flickable {
            id: flickArea
             anchors.fill: parent
             contentWidth: data.width; contentHeight: data.height
             flickableDirection: Flickable.VerticalFlick
             clip: true
        Text{
            id: data
            x: 15
            y: 15
            color: "#000000"
            for(var i =0; i<items_model.count; ++i)
            {
            text: items_model.get(i).name;
            }
            style: Text.Outline
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
        }*/

        ListModel {
            id: items_model
            ListElement{
                name: "Pizza"
                quantity: "5"
                dom: "11/11/2012"
                doe : "11/19/2012"
            }
            ListElement{
                name: "Milk"
                quantity: "1"
                dom: "11/11/2012"
                doe : "11/19/2012"
            }
            ListElement{
                name: "Tomatoes"
                quantity: "1"
                dom: "11/11/2012"
                doe : "11/19/2012"
            }
            ListElement{
                name: "Onions"
                quantity: "12"
                dom: "11/11/2012"
                doe : "11/19/2012"
            }
        }
        ListView {
            id: dataview
            width: parent.width
            height: parent.height
            anchors.fill: parent
            model: items_model
            delegate: itemDelegate
            verticalLayoutDirection: "TopToBottom"
            layoutDirection: verticalLayoutDirection

            focus: true
            highlight: highlight
        }
        Component {
            id: itemDelegate
            Item {
                width: 950; height: items_model.count*4
                x:0; y: 0
                z:4
                Row{
                    spacing: 200
                    Text { text: name }
                    Text { text: quantity }
                    Text { text: dom }
                    Text { text: doe }
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: parent.state = "selected"
                    onClicked: {dataview.currentIndex= index
                        console.log(quantity);
                        reducequantity(name, quantity, dom, doe, index);
                    }
                }

            }

        }




    }



    Image  {
        width: 1920
        height: 730
        source: "Images/1.png"
        x:0
        y:0
        z: 1
    }
    Image  {
        id: door

        width: 1920
        height: 730
        source: "Images/2.png"
        x:0
        y:0
        z: 4
    }
    Image  {
        width: 1920
        height: 450
        source: "Images/carpet2.png"
        x:0
        y:750
        z: 1
    }

    Image  {
        width: 380
        height: 350
        source: "Images/5.svg"
        x:1400
        y:700
        z: 4
    }
    Rectangle{
        id: rectangle2
        x: 1440
        y: 780
        z: 4
        width: 380
        height: 350
        color: "transparent"

        Flickable {
            id: flickArea1
            anchors.fill: parent
            contentWidth: notesdata.width; contentHeight: notesdata.height
            flickableDirection: Flickable.VerticalFlick
            clip: true
            TextEdit{
                id: notesdata
                x:15
                y: 15
                color: "#000000"
                text: qsTr("Juice\nCereal");
                //style: Text.Outline
                font.pointSize: 18
            }
        }
    }
    Text{
        id:perish
        x:120
        y: 210
        z:2
        color: "#000000"
        text: qsTr("Perishables");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 24
    }
    Text{
        id:nonperish
        x:80
        y: 510
        z:2
        color: "#000000"
        text: qsTr("Non-Perishables");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 24
    }
    Text{
        id:changename
        x:420
        y: 370
        z:2
        color: "#000000"
        text: qsTr("Name: ");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: changenameselecteddata
        x:480
        y: 370
        z:2
        color: "#000000"
        text: name;
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id:changequantity
        x:600
        y: 370
        z:2
        color: "#000000"
        text: qsTr("Quantity: ");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: changequantityselecteddata
        x:680
        y: 370
        z:2
        color: "#000000"
        text: quantity;
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id:changedom
        x:780
        y: 370
        z:2
        color: "#000000"
        text: qsTr("DOM:");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: changedomselecteddata
        x:830
        y: 370
        z:2
        color: "#000000"
        text: dom;
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id:changedoe
        x:960
        y: 370
        z:2
        color: "#000000"
        text: qsTr("DOE:");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: changedoeselecteddata
        x:1005
        y: 370
        z:2
        color: "#000000"
        text: doe;
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: index
        x:260
        y: 370
        z:2
        color: "#000000"
        text: "";
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
        visible: false
    }

    Button {
        id:changebutton
        x:1150
        y: 365
        z: 2
        text: qsTr("Update");
        onClicked: {
            items_model.setProperty(index.text, "name",changenameselecteddata.text)
            items_model.setProperty(index.text, "quantity",changequantityselecteddata.text)
            items_model.setProperty(index.text, "dom",changedomselecteddata.text)
            items_model.setProperty(index.text, "doe",changedoeselecteddata.text)
            if(changequantityselecteddata.text==0)
            {
                cabinetPane.state = "popup2"
                items_model.remove(index.text)
            }
            else if(changequantityselecteddata.text<5)
            {
                lessitems_model.insert(0, {"name1":changenameselecteddata.text, "quantity1":changequantityselecteddata.text, "dom1":changedomselecteddata.text, "doe1":changedoeselecteddata.text})            }
        }
    }
    Image{
        x:1600
        y:15
        z:4
        width: 35
        height:35
        source: "Images/alert.png"

    }

    Button {
        id:alertbutton
        x:1650
        y: 15
        z: 4

        text: qsTr("Alerts");
        onClicked: {
            cabinetPane.state = "popup"
              }
    }



    Rectangle{
        id: rectangle5
        x: 328
        y: 458
        z: 2
        width: 1425
        height: 120
        color: "#c2c1c1"
        /*Flickable {
            id: flickArea
             anchors.fill: parent
             contentWidth: data.width; contentHeight: data.height
             flickableDirection: Flickable.VerticalFlick
             clip: true
        Text{
            id: data
            x: 15
            y: 15
            color: "#000000"
            for(var i =0; i<items_model.count; ++i)
            {
            text: items_model.get(i).name;
            }
            style: Text.Outline
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
        }*/

        ListModel {
            id: npitems_model
            ListElement{
                name5: "Spoons"
                quantity5: "10"

            }
            ListElement{
                name5: "Forks"
                quantity5: "10"

            }
            ListElement{
                name5: "Plates"
                quantity5: "1"
            }
            ListElement{
                name5: "Bowls"
                quantity5: "2"
            }
        }
        ListView {
            id: npdataview
            width: parent.width
            height: parent.height
            anchors.fill: parent
            model: npitems_model
            delegate: npitemDelegate
            verticalLayoutDirection: "TopToBottom"
            layoutDirection: verticalLayoutDirection

            focus: true
            highlight: highlight
        }
        Component {
            id: npitemDelegate
            Item {
                width: 950; height: npitems_model.count*4
                x:0; y: 0
                z:4
                Row{
                    spacing: 200
                    Text { text: name5 }
                    Text { text: quantity5 }

                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: parent.state = "selected"
                    onClicked: {npdataview.currentIndex= index
                        console.log(quantity5);
                        npreducequantity(name5, quantity5,index);
                    }
                }

            }
        }
    }

    Text{
        id:changename1
        x:420
        y: 650
        z:2
        color: "#000000"
        text: qsTr("Name: ");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: changenameselecteddata1
        x:480
        y: 650
        z:2
        color: "#000000"
        text: name;
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id:changequantity1
        x:600
        y: 650
        z:2
        color: "#000000"
        text: qsTr("Quantity: ");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: changequantityselecteddata1
        x:680
        y: 650
        z:2
        color: "#000000"
        text: quantity;
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Button {
        id:changebutton1
        x:760
        y: 650
        z: 2
        text: qsTr("Update");
        onClicked: {
            npitems_model.setProperty(index.text, "name5",changenameselecteddata1.text)
            npitems_model.setProperty(index.text, "quantity5",changequantityselecteddata1.text)
            cabinetPane.state = "popup"
            if(changequantityselecteddata1.text==0)
            {
                cabinetPane.state = "popup2"
                npitems_model.remove(index.text)
            }
            /*else if(changequantityselecteddata.text<5)
            {
                lessitems_model.insert(0, {"name1":changenameselecteddata.text, "quantity1":changequantityselecteddata.text, "dom1":changedomselecteddata.text, "doe1":changedoeselecteddata.text})            }
        }*/




}
    }







    Text{
        id: additem
        x:220
        y: 795
        z:2
        color: "#000000"
        text: qsTr("Add Item");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id: nameoftheitemlabel
        x:220
        y: 825
        z:2
        color: "#000000"
        text: qsTr("Name: ");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: newdata
        x:280
        y: 825
        z:2
        color: "#000000"
        text: qsTr("Enter a Name");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id:quantityoftheitemlabel
        x:220
        y: 850
        z:2
        color: "#000000"
        text: qsTr("Quantity: ");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: quantitydata
        x:300
        y: 850
        z:2
        color: "#000000"
        text: qsTr("0");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id: categoryftheitemlabel
        x:220
        y: 875
        z:2
        color: "#000000"
        text: qsTr("Category: ");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }


    Rectangle {
        id:comboBox
        property variant items: ["Perishables", "Non Perishables"]
        property alias selectedItem: chosenItemText.text;
        property alias selectedIndex: listView.currentIndex;
        signal comboClicked;
        width: 120;
        height: 20;
        x:315
        y:875
        z: 100;
        smooth:true;
        radius:4;

        Rectangle {
            id:chosenItem
            radius:4;
            width:parent.width;
            height:comboBox.height;
            color: "lightsteelblue"
            smooth:true;
            Text {
                anchors.top: parent.top;
                anchors.left: parent.left;
                anchors.margins: 8;
                id:chosenItemText
                text:comboBox.items[0];
                font.family: "Arial"
                font.pointSize: 12;
                smooth:true
            }

            MouseArea {
                anchors.fill: parent;
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
            radius:4;
            anchors.top: chosenItem.bottom;
            anchors.margins: 2;
            color: "lightgray"

            ListView {
                id:listView
                height:500;
                model: comboBox.items
                currentIndex: 0
                delegate: Item{
                    width:comboBox.width;
                    height: comboBox.height;

                    Text {
                        text: modelData
                        anchors.top: parent.top;
                        anchors.left: parent.left;
                        anchors.margins: 5;

                    }
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            comboBox.state = ""
                            var prevSelection = chosenItemText.text
                            chosenItemText.text = modelData
                            if(chosenItemText.text != prevSelection){
                                comboBox.comboClicked();
                            }
                            listView.currentIndex = index;
                            console.log(index);
                            changeindex(index);
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
                radius: 4
            }
        }

        states: State {
            name: "dropDown";
            PropertyChanges { target: dropDown; height:30*comboBox.items.length }
        }

        transitions: Transition {
            NumberAnimation { target: dropDown; properties: "height"; easing.type: Easing.OutExpo; duration: 1000 }
        }
    }
    Text{
        id: domlabel
        x:220
        y: 900
        z:2
        color: "#000000"
        text: qsTr("DOM: ");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: dommonth
        x:270
        y: 900
        z:2
        color: "#000000"
        text: qsTr("MM");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id: slashlabel1
        x:300
        y: 900
        z:2
        color: "#000000"
        text: qsTr("/");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: domday
        x:310
        y: 900
        z:2
        color: "#000000"
        text: qsTr("DD");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id: slashlabel2
        x:340
        y: 900
        z:2
        color: "#000000"
        text: qsTr("/");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: domyear
        x:350
        y: 900
        z:2
        color: "#000000"
        text: qsTr("YYYY");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }

    Text{
        id: doelabel
        x:220
        y: 925
        z:2
        color: "#000000"
        text: qsTr("DOE: ");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: doemonth
        x:270
        y: 925
        z:2
        color: "#000000"
        text: qsTr("MM");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id: dslashlabel1
        x:300
        y: 925
        z:2
        color: "#000000"
        text: qsTr("/");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: doeday
        x:310
        y: 925
        z:2
        color: "#000000"
        text: qsTr("DD");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    Text{
        id: dslashlabel2
        x:340
        y: 925
        z:2
        color: "#000000"
        text: qsTr("/");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: doeyear
        x:350
        y: 925
        z:2
        color: "#000000"
        text: qsTr("YYYY");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
    TextEdit{
        id: changedindexnewitem
        x:350
        y: 925
        z:2
        color: "#000000"
        text: qsTr("0");
        //style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }

    Button {
        id:addaitembutton
        x:240
        y: 965
        z: 2
        text: qsTr("Add Item");
        onClicked: {
            if(changedindexnewitem.text==0)
            {
            items_model.insert(0, {"name": newdata.text, "quantity":quantitydata.text, "dom": dommonth.text+"/"+domday.text+"/"+domyear.text, "doe": doemonth.text+"/"+doeday.text+"/"+doeyear.text})
            }
            if(changedindexnewitem.text==1)
            {
                npitems_model.insert(0, {"name5":newdata.text, "quantity5":quantitydata.text})
            }
        }

    }


    states: [ State {
            name: "moved";
            PropertyChanges { target: door; x: 1780}
        },
        State {
            name: "popup";
            PropertyChanges {
                target: dialog1
                z:6
            }
            PropertyChanges {
                target: door
                visible: false
            }
        },
        State {
            name: "popup2";
            PropertyChanges {
                target: dialog2
                z:6
            }
            PropertyChanges {
                target: door
                visible: false
            }
        },
        State {
            name: "Closepopup2";
            PropertyChanges {
                target: dialog2
                z:0
            }
            PropertyChanges {
                target: door
                visible: false
            }
        },
        State {
            name: "Closepopup";
            PropertyChanges {
                target: dialog1
                z:0
            }
            PropertyChanges {
                target: door
                visible: false
            }
        }
    ]
    transitions: [ Transition {
            to: "moved"
            NumberAnimation { properties: "x"; duration:1600; easing.type: Easing.InOutQuad }
        },

        Transition {
            to: "popup"
            NumberAnimation { properties: "z"; duration:100; easing.type: Easing.InOutQuad }
        },
        Transition {
            to: "Closepopup"
            NumberAnimation { properties: "z"; duration:100; easing.type: Easing.InOutQuad }
        },
        Transition {
            to: "Closepopup2"
            NumberAnimation { properties: "z"; duration:100; easing.type: Easing.InOutQuad }
        }


    ]

    function reducequantity(name, quantity, dom, doe, indexchange){
        changenameselecteddata.text =name;
        changequantityselecteddata.text =quantity;
        changedomselecteddata.text =dom;
        changedoeselecteddata.text =doe;
        index.text = indexchange
    }
    function npreducequantity(name5, quantity5, indexchange){
        changenameselecteddata1.text =name5;
        changequantityselecteddata1.text =quantity5;
        index.text = indexchange
    }
    function changeindex(indexchanged){
        changedindexnewitem.text = indexchanged
    }

    Rectangle {
        id: dialog1
        x:500
        y:400
        z:0
        radius: 20
        width: 850
        height: 250
        color: "blue"
        Text{
            id: lowitems
            x:10
            y: 10
            z:2
            color: "white"
            text: qsTr("The following items are running low or about to expire:");
            //style: Text.Outline
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
        }
        Rectangle{
            id: rectanglemini
            x: 10
            y: 60
            width: 820
            height: 125
            color: "white"


            ListModel {
                id: lessitems_model
                ListElement{
                    name: "Milk"
                    quantity: "1"
                    dom: "11/11/2012"
                    doe : "11/19/2012"
                }
                ListElement{
                    name: "Tomatoes"
                    quantity: "1"
                    dom: "11/11/2012"
                    doe : "11/19/2012"
                }

            }
            ListView {
                id: lessdataview
                width: parent.width
                height: parent.height
                anchors.fill: parent
                model: lessitems_model
                delegate: lessitemDelegate
                verticalLayoutDirection: "TopToBottom"
                layoutDirection: verticalLayoutDirection

            }
            Component {
                id: lessitemDelegate
                Item {
                    width: 950; height: items_model.count*4
                    x:0; y: 0
                    z:4
                    Row{
                        spacing: 200
                        Text { text: name }
                        Text { text: quantity }
                        Text { text: dom }
                        Text { text: doe }
                    }

                }

            }

        }
        Button {
            id:close
            x:400
            y: 210
            z: 2
            text: qsTr("Close");
            onClicked: {
                cabinetPane.state = "Closepopup"
            }

        }
    }
    Rectangle {
        id: dialog2
        x:900
        y:400
        z:0
        radius: 20
        width: 450
        height: 100
        color: "blue"
        Text{
            id: addgrocery
            x:10
            y: 10
            z:2
            color: "red"
            text: qsTr("Do you want to add this item to the grocery \nlist:");
            //style: Text.Outline
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
        }

        Button {
            id:yes
            x:160
            y: 60
            z: 2
            text: qsTr("Yes");
            onClicked: {
                cabinetPane.state = "Closepopup2"
                if(changenameselecteddata.text!="")
                {
                notesdata.text = notesdata.text +"\n"+ changenameselecteddata.text
                }
                else
                {
                   notesdata.text = notesdata.text +"\n"+ changenameselecteddata1.text
                }
            }
        }

        Button {
            id:no
            x:220
            y: 60
            z: 2
            text: qsTr("Nope");
            onClicked: {
                cabinetPane.state = "Closepopup2"
            }
        }
    }

}


