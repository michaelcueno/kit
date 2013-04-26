import QtQuick 2.0

Rectangle
{
    id: container
    width: 1920; height: 1280
    color: "#C0C0C0"

    Component.onCompleted: init()

    GridView
    {
        id: numberGrid
        anchors {left: parent.left; bottom: parent.bottom; leftMargin: 110; bottomMargin: 600}
        cellWidth: 275; cellHeight: 244
        width: 1175; height: 500

        model: ListModel{
             ListElement{
                 number: 0;
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 number: 1;
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 number: 2;
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 number: 3;
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 number: 4;
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 number: 5;
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 number: 6;
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 number: 7;
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 number: 8;
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 number: 9;
                 src: "qrc:/images/calc/button.png"
             }
        }
        delegate:  Item{
                    width: numberGrid.cellWidth; height: numberGrid.height
                    Column{
                        anchors.fill: parent
                        Image{
                            source: src
                            Text {
                                text: number
                                font.bold: true
                                font.pixelSize: 50
                                anchors.centerIn: parent
                                color: "white"
                                smooth: true
                            }
                            MouseArea{
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: parent.opacity = .75
                                onExited: parent.opacity = 1
                                onPressed:{parent.source = "qrc:/images/calc/buttonPushed.png"}
                                onReleased:{if(clearBit == 1){
                                                output.text = "";
                                                clearBit = 0
                                            }
                                            if(output.text.length > 1){
                                                   output.text += number;
                                            }
                                            else if(number != 0){
                                                output.text += number;
                                            }
                                            parent.source = "qrc:/images/calc/button.png"}
                            }
                        }
                    }
                }
    }

    GridView
    {
        id: operatorGrid
        anchors {right: parent.right; top: parent.top; rightMargin: 175; topMargin: 180}
        cellWidth: 275; cellHeight: 244
        width: 500; height: 1250

        model: ListModel{
             ListElement{
                 operator: "*"
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 operator: "/"
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 operator: "+"
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 operator: "-"
                 src: "qrc:/images/calc/button.png"
             }
             ListElement{
                 operator: "="
                 src: "qrc:/images/calc/button.png"
             }
        }
        delegate:  Item{
                    width: operatorGrid.cellWidth; height: operatorGrid.height
                    Column{
                        anchors.fill: parent
                        Image{
                            source: src
                            Text {
                                text: operator
                                font.bold: true
                                font.pixelSize: 50
                                anchors.centerIn: parent
                                color: "white"
                                smooth: true
                            }
                            MouseArea{
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: parent.opacity = .75
                                onExited: parent.opacity = 1
                                onPressed:{parent.source = "qrc:/images/calc/buttonPushed.png"}
                                onReleased:{parent.source = "qrc:/images/calc/button.png";
                                            if(accum == 0)
                                            {
                                                accum = parseInt(output.text)
                                                opr = operator
                                            }
                                            else if(operator != "=")
                                            {
                                                operation(parseInt(output.text))
                                                opr = operator
                                            }
                                            else
                                            {
                                                operation(parseInt(output.text))
                                                output.text = accum
                                                accum = 0
                                            }

                                            clearBit = 1;}
                            }
                        }
                    }
                }
    }

    Rectangle
    {
        width: parent.width*(.8); height: parent.height*(.085)
        anchors{left: parent.left; leftMargin: 200; top: parent.top; topMargin: 25}
        color: "#598787"
        border.color: "#658a8a"
        border.width: 5
        radius: 5

        TextInput
        {
            id: output
            readOnly: true
            anchors.fill: parent
            font.pixelSize: parent.height - 20
            font.bold: true
            color: "#adecec"
            maximumLength: 25
            horizontalAlignment: TextInput.AlignRight
            anchors.verticalCenter: parent.verticalCenter
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

    property int clearBit: 0;
    property int accum: 0;
    property string opr: "";

    function init()
    {
        container.state = "hidden"
    }
    function operation(operand2)
    {
        console.log(accum)
        switch(opr)
        {
            case "-":
                accum = accum - operand2;
                break;
            case "+":
                accum = accum + operand2;
                break;
            case "*":
                accum = accum * operand2;
                break;
            case "/":
                if(operand2 !== 0)
                    accum = accum/operand2;
                break;
            default:
                break;
        }
        console.log(accum, opr, operand2)
    }

    function conversion()
    {
        var result
        switch(type)
        {
            case "lbs -> oz":
                result = accum * 16;
                break;
            case "oz -> lbs":
                result = accum * (0.0625);
                break;
            case "l -> gal":
                result = accum * (0.264)
                break;
            case "gal -> l":
                result = accum * (3.785)
                break;
        }
    }
}
