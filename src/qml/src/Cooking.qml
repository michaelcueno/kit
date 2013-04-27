    import QtQuick 2.0

Rectangle
{
    property string ltr: ""

    id: cookingMain
    width: 1920
    height: 1080
    color: "#C0C0C0"

    function shrinkLetters()
    {
        var a_x = alphabetList.x
        var a_y = alphabetList.y
        var max = alphabetList.count
        for(var i = 0, j = 0; i < max; i++, j = j + 75)
        {
            if(alphabetList.itemAt(a_x, a_y+j) != null)
                alphabetList.itemAt(a_x, a_y+j).width = 150
        }
    }
    Component
    {
        id: ingDelegate
        Rectangle
        {
            width:parent.width
            height: 50
            color: "white"
            border.color: "grey"
            border.width: 5
            Text
            {
                id: ingNameText
                text: name
                font.pixelSize: 20
                font.bold: true
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            Text
            {
                id: ingAmountText
                text: amount
                font.pixelSize: 20
                font.bold: true
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{

                }
            }
        }
    }
    Component
    {
        id: instructionDelegate
        Rectangle
        {
            width:parent.width
            height: 50
            color: "white"
            border.color: "grey"
            border.width: 5
            Text
            {
                id: delegateText
                text: name
                font.pixelSize: 20
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                anchors.fill: parent
            }
        }
    }
    Component
    {
        id: itemListDelegate
        Rectangle
        {
            width:parent.width
            height: 50
            color: "white"
            border.color: "grey"
            border.width: 5
            Text
            {
                id: delegateText
                text: name
                font.pixelSize: 20
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    infoBars.start()

                    if(recipeTitle.opacity == 0)
                        fadeInRecipe.start()

                    recipeTitleText.text = delegateText.text
                    almondCookieHave.opacity = 0
                    almondCookieHave.z = 0
                    almondCookieNeed.opacity = 0
                    almondCookieNeed.z = 0
                    almondInstructions.opacity = 0
                    almondInstructions.z = 0
                    applePieHave.opacity = 0
                    applePieHave.z = 0
                    applePieNeed.opacity = 0
                    applePieNeed.z = 0
                    applePieInstructions.opacity = 0
                    applePieInstructions.z = 0
                    granolaCookieHave.opacity = 0
                    granolaCookieHave.z = 0
                    granolaCookieNeed.opacity = 0
                    granolaCookieNeed.z = 0
                    granolaCookieInstructions.opacity = 0
                    granolaCookieInstructions.z = 0
                    if(delegateText.text == "Almond Cookie")
                    {
                        almondCookieHave.opacity = 1
                        almondCookieHave.z = 1

                        almondCookieNeed.opacity = 1
                        almondCookieNeed.z = 1

                        almondInstructions.opacity = 1
                        almondInstructions.z = 1
                    }
                    else if(delegateText.text == "Apple Pie")
                    {
                        applePieHave.opacity = 1
                        applePieHave.z = 1

                        applePieNeed.opacity = 1
                        applePieNeed.z = 1

                        applePieInstructions.opacity = 1
                        applePieInstructions.z = 1
                    }
                    else if(delegateText.text == "Granola Cookie")
                    {
                        granolaCookieHave.opacity = 1
                        granolaCookieHave.z = 1

                        granolaCookieNeed.opacity = 1
                        granolaCookieNeed.z = 1

                        granolaCookieInstructions.opacity = 1
                        granolaCookieInstructions.z = 1
                    }
                }
                SequentialAnimation
                {
                    id:fadeInRecipe
                    PropertyAnimation
                    {
                        target: recipeIngrediantsHave
                        properties: "opacity"
                        to: 1
                        duration: 150
                    }
                    PropertyAnimation
                    {
                        target: recipeIngrediantsNeed
                        properties: "opacity"
                        to: 1
                        duration: 150
                    }
                    PropertyAnimation
                    {
                        target: recipeInstructions
                        properties: "opacity"
                        to: 1
                        duration: 150
                    }
                    PropertyAnimation
                    {
                        target: recipeTitle
                        properties: "opacity"
                        to: 1
                        duration: 150
                    }
                    PropertyAnimation
                    {
                        target: nutritionalGraph
                        properties: "opacity"
                        to: 1
                        duration: 150
                    }
                }

                ParallelAnimation
                {
                    id:infoBars
                    PropertyAnimation
                    {
                        target: caloriesBar
                        properties: "height"
                        to: cal
                        duration: 300
                    }
                    PropertyAnimation
                    {
                        target: proteinBar
                        properties: "height"
                        to: pro
                        duration: 300
                    }
                    PropertyAnimation
                    {
                        target: fatBar
                        properties: "height"
                        to: f
                        duration: 300
                    }
                    PropertyAnimation
                    {
                        target: carbsBar
                        properties: "height"
                        to: c
                        duration: 300
                    }
                }
            }
        }
    }
    Rectangle
    {
        id:switchpane
        width: 100
        height: parent.height
        color: "transparent"
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
        anchors.left: parent.left
        anchors.leftMargin: 150
        color: "#D0D0D0"
        border.color: "#CACACA"
        border.width: 5
        ListView
        {
            id: aItems
            width: parent.width
            height: parent.height
            opacity: 0
            z: 0
            model:ListModel
            {
                ListElement{
                    name: "Almond Cookie"
                    cal: 100
                    pro: 100
                    f: 200
                    c: 100
                }
                ListElement{
                    name: "Apple Pie"
                    cal: 350
                    pro: 200
                    f: 350
                    c: 250
                }
            }
            delegate: itemListDelegate
        }
        ListView
        {
            id: gItems
            width: parent.width
            height: parent.height
            opacity: 0
            z: 0
            model:ListModel
            {
                ListElement{
                    name: "Granola Cookie"
                    cal: 200
                    pro: 10
                    f: 15
                    c: 2
                }
                ListElement{
                    name: "Goose"
                    cal: 200
                    pro: 10
                    f: 5
                    c: 2
                }
                ListElement{
                    name: "Gravy"
                    calories: 200
                    protein: 10
                    f: 5
                    c: 2
                }
                ListElement{
                    name: "Gyro"
                    cal: 200
                    pro: 10
                    f: 10
                    c: 2
                }
            }
            delegate: itemListDelegate
        }
        ListView
        {
            id: noItems
            width: parent.width
            height: parent.height
            opacity: 0
            z: 0
            model:ListModel
            {
                ListElement{name: ""}
            }
            delegate:  Component{
            Rectangle
            {
                width:parent.width
                height: 50
                color: "white"
                border.color: "grey"
                border.width: 5
                Text
                {
                    id: delegateText
                    text: "No recipes under " + ltr
                    font.pixelSize: 20
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        recipeTitleText.text = delegateText.text
                    }
                }
            }
        }
        }
    }
    ListView
    {
        id: alphabetList
        width: 150
        height: 1080
        snapMode: ListView.SnapToItem

        model:ListModel
        {
            ListElement{letter: "A"; clr: "black"}
            ListElement{letter: "B"; clr: "grey"}
            ListElement{letter: "C"; clr: "grey"}
            ListElement{letter: "D"; clr: "grey"}
            ListElement{letter: "E"; clr: "grey"}
            ListElement{letter: "F"; clr: "grey"}
            ListElement{letter: "G"; clr: "black"}
            ListElement{letter: "H"; clr: "grey"}
            ListElement{letter: "I"; clr: "grey"}
            ListElement{letter: "J"; clr: "grey"}
            ListElement{letter: "K"; clr: "grey"}
            ListElement{letter: "L"; clr: "grey"}
            ListElement{letter: "M"; clr: "grey"}
            ListElement{letter: "N"; clr: "grey"}
            ListElement{letter: "O"; clr: "grey"}
            ListElement{letter: "P"; clr: "grey"}
            ListElement{letter: "Q"; clr: "grey"}
            ListElement{letter: "R"; clr: "grey"}
            ListElement{letter: "S"; clr: "grey"}
            ListElement{letter: "T"; clr: "grey"}
            ListElement{letter: "U"; clr: "grey"}
            ListElement{letter: "V"; clr: "grey"}
            ListElement{letter: "W"; clr: "grey"}
            ListElement{letter: "X"; clr: "grey"}
            ListElement{letter: "Y"; clr: "grey"}
            ListElement{letter: "Z"; clr: "grey"}
        }
        delegate:Component
        {
            Rectangle
            {
                id: alphabetRect
                width: 150
                height:75
                color: clr
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
                    onClicked:{
                    ltr = letter
                    hideLists.start()
                    shrinkLetters()
                    if(letter == "A")
                    {aAnimation.start()
                     aItems.z = 1
                     gItems.z = 0
                     noItems.z = 0}
                    else if(letter == "G")
                    {gAnimation.start()
                        aItems.z = 0
                        gItems.z = 1
                        noItems.z = 0}
                    else
                    {noAnimation.start()
                        aItems.z = 0
                        gItems.z = 0
                        noItems.z = 1}
                     grow.start()}
                }
                PropertyAnimation
                {
                    id:aAnimation
                    target: aItems
                    properties: "opacity"
                    to: 1
                    duration: 400
                }
                PropertyAnimation
                {
                    id:gAnimation
                    target: gItems
                    properties: "opacity"
                    to: 1
                    duration: 400
                }
                PropertyAnimation
                {
                    id: noAnimation
                    target: noItems
                    properties: "opacity"
                    to: 1
                    duration: 400
                }
                ParallelAnimation
                {
                    id: hideLists
                    PropertyAnimation
                    {

                        target: aItems
                        properties: "opacity"
                        to: 0
                        duration: 0
                    }
                    PropertyAnimation
                    {

                        target: gItems
                        properties: "opacity"
                        to: 0
                        duration: 0
                    }
                    PropertyAnimation
                    {

                        target: noItems
                        properties: "opacity"
                        to: 0
                        duration: 0
                    }
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
                            to: 175
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
    Rectangle
    {
        id: recipeTitle
        opacity: 0
        width: parent.width*(.6)
        height: 100
        anchors{top: parent.top; left: parent.left; topMargin: 25; leftMargin: recipeTitle.width/2}
        color: "#D0D0D0"
        border.color: "#CACACA"
        border.width: 5
        Text
        {
                id: recipeTitleText
                text: "ASDASd"
                font.pixelSize: 30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
        }
    }
    Rectangle
    {
        id: recipeInstructions
        opacity: 0
        width: parent.width*(.25)
        height: 300
        anchors{top: parent.top; left: parent.left; topMargin: 150; leftMargin: recipeTitle.width/2}
        color: "#D0D0D0"
        border.color: "#CACACA"
        border.width: 5
        ListView
        {
            id: almondInstructions
            opacity: 0
            clip: true
            anchors.fill: parent
                z: 0
            model: ListModel{
                ListElement{
                    name: "This is a test"
                }
                ListElement{
                    name: "This is a test"
                }
                ListElement{
                    name: "This is a test"
                }
            }
            delegate: instructionDelegate
        }
            ListView
            {
                id:applePieInstructions
                opacity: 0
                clip: true
                anchors.fill: parent
                z:0
                model: ListModel{
                    ListElement{
                        name: "This is a test2"
                    }
                    ListElement{
                        name: "This is a test2"
                    }
                    ListElement{
                        name: "This is a test2"
                    }
                }
                delegate: instructionDelegate
            }
            ListView
            {
                id: granolaCookieInstructions
                opacity: 0
                clip: true
                z:0
                anchors.fill: parent
                model: ListModel{
                    ListElement{
                        name: "This is a test3"
                    }
                    ListElement{
                        name: "This is a test3"
                    }
                    ListElement{
                        name: "This is a test3"
                    }
                }
                delegate: instructionDelegate
            }
    }
    Rectangle
    {
        id: recipeIngrediantsHave
        opacity: 0
        width: parent.width*(.25)
        height:200
        anchors{top: parent.top; left: parent.left; topMargin: 475; leftMargin: recipeTitle.width/2}
        color: "#D0D0D0"
        border.color: "#CACACA"
        border.width: 5
        ListView
        {
            id: almondCookieHave
            width: parent.width
            height: parent.height
            clip: true
            z: 0
            opacity: 0
            model:ListModel
            {
                ListElement
                {
                        name: "Almonds"
                        amount: "1 Cup"
                }
                ListElement
                {
                        name: "Sugar"
                        amount: "3/4 Cup"
                }
                ListElement
                {
                        name: "Egg White"
                        amount: "1"
                }
            }
            delegate: ingDelegate
        }
        ListView
        {
            id: applePieHave
            width: parent.width
            height: parent.height
            clip: true
            z: 0
            opacity: 0
            model:ListModel
            {
                ListElement
                {
                        name: "Apples"
                        amount: "A Dozen"
                }
                ListElement
                {
                        name: "Sugar"
                        amount: "3/4 Cup"
                }
                ListElement
                {
                        name: "Pie Crust"
                        amount: "1"
                }
            }
            delegate: ingDelegate
        }
        ListView
        {
            id: granolaCookieHave
            width: parent.width
            height: parent.height
            clip: true
            z: 0
            opacity: 0
            model:ListModel
            {
                ListElement
                {
                        name: "granola"
                        amount: "1 Cup"
                }
                ListElement
                {
                        name: "Sugar"
                        amount: "3/4 Cup"
                }
                ListElement
                {
                        name: "Butter"
                        amount: "1/2 Stick"
                }
            }
            delegate: ingDelegate
        }
    }
    Rectangle
    {
        id: recipeIngrediantsNeed
        opacity: 0
        width: parent.width*(.25)
        height:200
        anchors{top: parent.top; left: parent.left; topMargin: 700; leftMargin: recipeTitle.width/2}
        color: "#D0D0D0"
        border.color: "#CACACA"
        border.width: 5

        ListView
        {
            id: almondCookieNeed
            width: parent.width
            height: parent.height
            clip: true
            opacity: 0
            z: 0
            model:ListModel
            {
                ListElement
                {
                        name: "Butter"
                        amount: "1/2 Cup"
                }
                ListElement
                {
                        name: "Flour"
                        amount: "1 Cup"
                }
            }
            delegate: ingDelegate
        }
        ListView
        {
            id: applePieNeed
            width: parent.width
            height: parent.height
            clip: true
            z: 0
            opacity: 0
            model:ListModel
            {
            ListElement
            {
                    name: "Butter"
                    amount: "1/2 Cup"
            }
            ListElement
            {
                    name: "Flour"
                    amount: "1 Cup"
            }
            }
            delegate: ingDelegate
        }
        ListView
        {
                id: granolaCookieNeed
                width: parent.width
                height: parent.height
                clip: true
                z: 0
                opacity: 0
                model:ListModel
                {
                ListElement
                {
                        name: "Butter"
                        amount: "1/2 Cup"
                }
                ListElement
                {
                        name: "Flour"
                        amount: "1 Cup"
                }
                }
                delegate: ingDelegate
            }
    }
    Rectangle
    {
        id: nutritionalGraph
        opacity: 0
        width: parent.width*(.3)
        height:750
        anchors{top: parent.top; left: parent.left; topMargin: 150; leftMargin: parent.width*.6}
        color: "#D0D0D0"
        border.color: "#CACACA"
        border.width: 5
        Image
        {
                source: "qrc:/images/Cook/graph.png"
                anchors{fill: parent; topMargin: 5; bottomMargin: 5; leftMargin: 5; rightMargin: 5}
        }
        Rectangle
        {
            id: caloriesBar
            color: "red"
            width: 100
            height: 0
            opacity: .75
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 47
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
        Rectangle
        {
            id:fatBar
            color: "blue"
            width: 100
            height: 0
            opacity: .75
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 47
            anchors.left: parent.left
            anchors.leftMargin: 200
        }
        Rectangle
        {
            id:proteinBar
            color: "green"
            width: 100
            height: 0
            opacity: .75
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 47
            anchors.left: parent.left
            anchors.leftMargin: 325
        }
        Rectangle
        {
            id:carbsBar
            color: "orange"
            width: 100
            height: 0
            opacity: .75
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 47
            anchors.left: parent.left
            anchors.leftMargin: 450
        }
    }
}

