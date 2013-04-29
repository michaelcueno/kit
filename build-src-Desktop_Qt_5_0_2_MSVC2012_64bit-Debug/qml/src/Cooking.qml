import QtQuick 2.0
import "recipes.js" as Rps

Rectangle
{
    property string ltr: ""

    id: cookingMain
    width: 1920
    height: 1080
    color: "#C0C0C0"

    Rectangle
    {
        id:switchpane
        width: 100
        height: parent.height
        color: "tan"
        anchors.right: parent.right
        MouseArea
        {
            anchors.fill: parent
            onClicked: main.move_to(mainWindow);
        }
    }
    Rectangle
    {
        id: itemList
        width: 0
        height: 1080
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 150
        color: "#D0D0D0"
        border.color: "#CACACA"
        border.width: 5
        ListView
        {
            id: items
            width: parent.width
            height: parent.height
            model:ListModel
            {
             //   ListElement{name: (Rps.getRec(ltr, items.currentIndex))}
              //  ListElement{name: (Rps.getRec(ltr, items.currentIndex))}
               // ListElement{name: (Rps.getRec(ltr, items.currentIndex))}
            }
            delegate: Component{
                Rectangle
                {
                    width:parent.width
                    height: 50
                    color: "white"
                    border.color: "grey"
                    border.width: 5
                    Text
                    {
                        text: name
                        font.pixelSize: 20
                        font.bold: true
                    }
                }
            }
        }
    }
    Rectangle
    {
        id:recentItem
        width: 300
        height: 50
        anchors.left: parent.left
        anchors.leftMargin: 150
        color: "#D0D0D0"
        border.color: "#CACACA"
        border.width: 5
    }
    ListView
    {
        width: 150
        height: 1080
        model:ListModel
        {
            ListElement{letter: "~"}
            ListElement{letter: "A"}
            ListElement{letter: "B"}
            ListElement{letter: "C"}
            ListElement{letter: "D"}
            ListElement{letter: "E"}
            ListElement{letter: "F"}
            ListElement{letter: "G"}
            ListElement{letter: "H"}
            ListElement{letter: "I"}
            ListElement{letter: "J"}
            ListElement{letter: "K"}
            ListElement{letter: "L"}
            ListElement{letter: "M"}
            ListElement{letter: "N"}
            ListElement{letter: "O"}
            ListElement{letter: "P"}
            ListElement{letter: "Q"}
            ListElement{letter: "R"}
            ListElement{letter: "S"}
            ListElement{letter: "T"}
            ListElement{letter: "U"}
            ListElement{letter: "V"}
            ListElement{letter: "W"}
            ListElement{letter: "X"}
            ListElement{letter: "Y"}
            ListElement{letter: "Z"}
        }
        delegate:Component
        {
            Rectangle
            {
                id: alphabetRect
                width: 150
                height:75
                color: "black"
                Text
                {
                    text: letter
                    color: "white"
                    font.pixelSize: 50
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:{grow.start()}
                }
                SequentialAnimation
                {
                    id: grow
                    ParallelAnimation
                    {
                        PropertyAnimation
                        {
                            target: alphabetRect
                            properties: "width"
                            to: 200
                            duration: 100
                        }
                        PropertyAnimation
                        {
                            target:alphabetRect
                            properties: "height"
                            to: 100
                            duration: 100
                        }
                    }
                    PropertyAnimation
                    {
                        target: itemList
                        properties: "width"
                        to: 300
                        duration: 150
                    }
                }
            }
        }
    }
  /* Rectangle
   {
       x: 0;
       y: 0;
       width: 100
       height: 1080
       color: "transparent"
       z: 2
       Flickable
        {
            anchors.fill: parent
            contentHeight: cookingIndex.height
            contentWidth: cookingIndex.width
            flickableDirection: Flickable.VerticalFlick
            Column
            {
                id:cookingIndex
                Repeater
                {
                    model: 26
                    Rectangle
                    {
                        id: letterRect
                        width: 100
                        height: 43
                        color: "black"
                        Text
                        {
                            id: letter
                            anchors.centerIn: parent
                            text: alphabet.charAt(index)
                            font.pointSize: 15
                            color: "white"
                        }
                        MouseArea
                        {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                letterRect.width += 25
                                letterRect.height += 25
                            }
                            onExited: {
                                letterRect.width -= 25
                                letterRect.height -= 25
                            }

                            onClicked: {    showandgrow.start()
                                            createList(letter.text)}
                        }
                   }
               }
           }
       }
   }

    Rectangle
    {
        id:recipeNameList
        x: 80;
        color: "#5D442B"
        width: 0
        height: 1080
        radius: 5
        z: 1

        border.color: "#3D250E"
        border.width: 5

        Flickable
        {
            x: 20
            contentHeight: recipeList.height
            contentWidth: recipeList.width
            flickableDirection: Flickable.VerticalFlick
            Column
            {
                id:recipeList
                opacity: 0
                spacing: 3
                Repeater
                {
                    id: recipeWidget
                    model: 10
                    Text
                    {
                        id:recipeName
                        text: ""
                        font.pixelSize: 20

                        MouseArea
                        {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {if(recipeName.text != ""){recipeName.color = "#AE8B68"}}
                            onExited: {recipeName.color = "black"}
                            onClicked: {if(recipeName.text != ""){
                                        showPanes.start();
                                        loadRecipe(recipeName.text)}}
                        }
                    }
                }
            }
        }
        SequentialAnimation
        {
            id:showandgrow
            PropertyAnimation
            {
                target:recipeNameList
                properties: "width"
                to: 300
                duration: 750
            }
            PropertyAnimation
            {
                target:recipeList
                properties:"opacity"
                to: 1
                duration: 1000
            }
        }
    }

    Rectangle
    {
        id: titlePane
        opacity: 0
        width: 1280; height: 100
        x: 450; y: 100
        color: "#5D442B"
        radius: 5

        border.color: "#3D250E"
        border.width: 5


        Text
        {
            id: titlePaneText
            text: ""
            anchors.centerIn: parent
            font.pixelSize: 80
            font.bold: true
        }
    }

    Rectangle
    {
        id: instructionPane
        opacity: 0
        width: 400; height: 700
        x: parent.width - 600; y: parent.height - 750
        color: "#5D442B"
        radius: 5

        border.color: "#3D250E"
        border.width: 5


        Text
        {
            id:instructionPaneText
            text: ""
            font.pixelSize: 20
        }

        ParallelAnimation
        {
            id: showPanes

            PropertyAnimation
            {
                target: titlePane
                properties: "opacity"
                to: 1
                duration: 1000
            }

            PropertyAnimation
            {
                target: instructionPane
                properties: "opacity"
                to: 1
                duration: 1000
            }
            PropertyAnimation
            {
                target: ingRect
                properties: "opacity"
                to: 1
                duration: 1000
            }
            PropertyAnimation
            {
                target: potRect
                properties: "opacity"
                to: 1
                duration: 1000
            }
        }
    }

    Rectangle
    {
        id:ingRect
        width: 200; height: 400;
        x: 450; y: 400;
        color: "#5D442B"
        radius: 5
        opacity: 0

        border.color: "#3D250E"
        border.width: 5
    }

    Flickable
    {
        x: 460
        y: 410
        contentHeight: ingCol.height
        contentWidth: ingCol.width
        flickableDirection: Flickable.VerticalFlick
        Column
        {
            id:ingCol
            spacing: 3
            Repeater
            {
                id:ingredientList
                model:10
                Text
                {
                    id: ingText
                    text: ""
                    font.pixelSize: 20

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {ingText.color = "#AE8B68"; ingText.color = "#AE8B68"}
                        onExited: {ingText.color = "black"; ingText.color = "black"}
                        onClicked:{haveIngredient(ingText.text)
                                   spriteTimer.start()}
                    }
                }
            }
        }
    }

    Rectangle
    {
        id:potRect
        x: 675; y: 300;
        width: 600; height: 800;
        color: "transparent"
        opacity: 0
        AnimatedSprite
        {
            id: sprite
            width: parent.width
            height: parent.height
            source: "qrc:/images/Cook/potSprite.png"
            frameCount: 6
            frameSync: true
            frameWidth: parent.width
            frameHeight: parent.height
            paused: true
            Timer
            {
                id: spriteTimer
                interval: 150
                running: false
                repeat: true
                onTriggered: {
                    sprite.advance()
                }
            }
        }
        Rectangle
        {
            height: 600
            width: 550
            x:50; y: 150
            color: "transparent"
            Flickable
            {
                anchors.fill: parent
                contentHeight: parent.height
                contentWidth: parent.width
                flickableDirection: Flickable.VerticalFlick
                Column
                {
                    spacing: 3
                    Repeater
                    {
                        id:potList
                        model:10
                        Text
                        {
                            id: potText
                            text: ""
                            font.pixelSize: 20
                            MouseArea
                            {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {potText.color = "#AE8B68"; potText.color = "#AE8B68"}
                                onExited: {potText.color = "black"; potText.color = "black"}
                                onClicked:{dontHaveIngredient(potText.text)
                                           if(index == 0)
                                           {
                                               spriteTimer.stop()
                                               sprite.currentFrame = 0
                                           }}
                            }
                        }
                    }
                }
            }
        }
    }
    function createList(letter)
    {

        var numRec
        var dictionary

        if(letter == "A")
        {
            dictionary = ["Apple Pie", "Angel Food Cake"]
        }

        else if(letter == "G")
            dictionary = ["Garden Dip", "Grilled Salmon","Groundnut Stew", "Guacamole", "Gumbo", "Gyro"]

        else
        {
            var empty = "Recipe List for " + letter + " is empty...";
            dictionary = [empty]
        }

        numRec = dictionary.length

        for(var i = 0; i < 10; i++)
        {
            if(i < numRec)
                recipeWidget.itemAt(i).text = dictionary[i]
            else
                recipeWidget.itemAt(i).text = ""
        }
    }

    function loadRecipe(rName)
    {
        var numIng
        var ingredients
        titlePaneText.text = rName
        if(rName == "Apple Pie")
        {
            instructionPaneText.text = "Back that shit"
            ingredients = ["Apples 10", "Pie Crust 1", "Cinnomin 1 TBSP"]
            numIng = ingredients.length
        }
        else
        {
            ingredients =[""];
        }

        for(var i = 0; i < 10; i++)
        {
            if(i < numIng)
                ingredientList.itemAt(i).text = ingredients[i]
            else
                ingredientList.itemAt(i).text = ""
        }
    }

    function haveIngredient(hIng)
    {
        for(var i = 0; i < 10; i++)
        {
            if(ingredientList.itemAt(i).text == hIng && i == 9)
                ingredientList.itemAt(i).text = ""
            else if(ingredientList.itemAt(i).text == hIng)
            {
                while(i < 9)
                {
                    ingredientList.itemAt(i).text = ingredientList.itemAt(i+1).text
                    i++;
                }
            }
        }
        potList.itemAt(index).text = hIng
        index++
    }
    function dontHaveIngredient(hIng)
    {
        for(var i = 0; i < 10; i++)
        {
            if(potList.itemAt(i).text == hIng && i == 9)
                potList.itemAt(i).text = ""
            else if(potList.itemAt(i).text == hIng)
            {
                while(i < 9)
                {
                    potList.itemAt(i).text = potList.itemAt(i+1).text
                    i++;
                }
            }
        }
        index--
        ingredientList.itemAt(index).text = hIng
    }*/
}

