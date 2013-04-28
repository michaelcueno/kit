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
            if(alphabetList.itemAt(a_x, (a_y+j)) != null)
                alphabetList.itemAt(a_x, (a_y+j)).width = 150
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
            id: instructionRect
            width:parent.width
            height: name.length
            color: "white"
            border.color: "grey"
            border.width: 5
            Text
            {
                id: delegateText
                text: name
                font.pixelSize: 20
                font.bold: true
                wrapMode: Text.WordWrap
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.topMargin: 10
                clip: true
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{
                }
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
                    gravyHave.z = 0
                    gravyHave.opacity = 0
                    gravyInstructions.z = 0
                    gravyInstructions.opacity = 0
                    gyroHave.z = 0
                    gyroHave.opacity = 0
                    gyroInstructions.z = 0
                    gyroInstructions.opacity = 0
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
                    else if(delegateText.text == "Gravy")
                    {
                        gravyHave.opacity = 1
                        gravyHave.z = 1

                        gravyInstructions.opacity = 1
                        gravyInstructions.z = 1
                    }
                    else if(delegateText.text == "Gyro")
                    {
                        gyroHave.opacity = 1
                        gyroHave.z = 1

                        gyroInstructions.opacity = 1
                        gyroInstructions.z = 1
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
                    f: 150
                    c: 200
                }
                ListElement{
                    name: "Gravy"
                    calories: 200
                    protein: 100
                    f: 500
                    c: 300
                }
                ListElement{
                    name: "Gyro"
                    cal: 200
                    pro: 100
                    f: 100
                    c: 200
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
                text: ""
                font.pixelSize: 50

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
                    name: "Stir together flour, ground almonds, baking powder, and salt; set aside."
                }
                ListElement{
                    name: "In a mixing bowl cream butter and sugar at medium speed of electric hand held mixer. Beat in egg white and almond extract."
                }
                ListElement{
                    name: "Stir flour and ground almond mixture into the creamed mixture. Cover with plastic wrap; chill for about 2 hours."
                }
                ListElement{
                    name: "Shape dough into small balls, about 3/4-inch. Place balls 2 inches apart; flatten slightly with the bottom of a glass. Press an almond into the center of each cookie. Bake at 350° for about 12 minutes, or until set but not browned."
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
                    name: "Preheat oven to 425 degrees F (220 degrees C). Melt the butter in a saucepan. Stir in flour to form a paste. Add water, white sugar and brown sugar, and bring to a boil. Reduce temperature and let simmer."
                }
                ListElement{
                    name: "Place the bottom crust in your pan. Fill with apples, mounded slightly. Cover with a lattice work crust. Gently pour the sugar and butter liquid over the crust. Pour slowly so that it does not run off."
                }
                ListElement{
                    name: "Bake 15 minutes in the preheated oven. Reduce the temperature to 350 degrees F (175 degrees C). Continue baking for 35 to 45 minutes, until apples are soft."
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
                    name: " Preheat oven to 375 degrees F. Line baking sheets with parchment paper or silicone mats; set aside."
                }
                ListElement{
                    name: "Put the granola in a large bowl and break up any clumps with your fingers. Add the raisins, peanuts, almonds, coconut and wheat germ and mix together."
                }
                ListElement{
                    name: "With an electric mixer, beat the butter at medium speed until smooth, about 2 minutes. Add the sugars and beat for another 3 minutes, or until creamy. Add the egg and salt and beat until well blended. Reduce the mixer speed to low and add the flour, mixing only until it is incorporated, then steadily add the granola mixture. Stop the mixer when most of the granola mixture is blended into the batter and finish the job with a sturdy rubber spatula, making sure to get up any bits of dry ingredients left in the bottom of the bowl."
                }
                ListElement{
                    name: "Scoop out about two tablespoonfuls of dough, pack the scoops between your palms and arrange the mounds on the baking sheets. Flatten the mounds lightly with your fingertips."
                }
                ListElement{
                    name: "Bake for 10 to 12 minutes. The cookies should be golden brown but not firm. Allow them to rest on the sheets for 1 to 2 minutes before transferring them to racks to cool to room temperature. Store cookies in an airtight container at room temperature."
                }
            }
            delegate: instructionDelegate
        }
        ListView
        {
            id: gravyInstructions
            opacity: 0
            clip: true
            z:0
            anchors.fill: parent
            model: ListModel{
                ListElement{
                    name: " Remove the roast from the pan. Place pan on stove on medium high heat. Pour off all but 2 Tbsp of the drippings in the pan."
                }
                ListElement{
                        name: "Dissolve 2 Tbsp of corn starch in the minimum amount of water needed to make a thin paste - about 1/4 cup. Pour into pan with drippings and use a wire whisk or spatula (as pictured) to blend into the drippings"
                }
                ListElement{
                    name: "Stir with a wire whisk until the gravy begins to thicken. As it thickens, slowly add water, stock, milk, or cream, or some combination to the pan. Alternate stirring and adding liquid, maintaining the consistency you want, for several minutes (about 5). You will probably add about 2 cups of liquid all together. Taking into consideration the evaporation that is occurring while you are cooking, you will end up with about 2 cups of gravy. Season with salt."
                }
            }
            delegate: instructionDelegate

        }
        ListView
        {
            id: gyroInstructions
            opacity: 0
            clip: true
            z:0
            anchors.fill: parent
            model: ListModel{
                ListElement{
                    name: "Combine all ingredients in a bowl, and mix well."
                }
                ListElement{
                    name: "Knead the mixture on the counter for 10 minutes - just like you're kneading bread. You may want to use a dough-scraper to help keep the counter clean. (I do). Pick that meat up and SLAM it into the counter, continuing to do so for the 10 minutes. This is key to getting the correct texture. I'm no Alton Brown, but I think the thing we're doing here is melting the fat so that we get a nice smooth texture in the end."
                }
                ListElement{
                        name: "Form into a flat loaf - I like to put the meat onto a piece of wax paper, and flattening it into a 3 in. high slab rectangle. I cover it with another piece of wax and use a rolling pin to flatten it out, just make sure you straighten out the edges to form a rectangle so that when it comes time to slice, they are nice and even."
                }
                ListElement{
                    name: "Bake the loaf on a broiler pan (or pan with raised edges, because it will leak grease!) at 350 for about an hour. Alternatively, you can grill it over coals, that's my favorite way, just be sure to turn often so as to distribute the juices."
                }
                ListElement{
                    name: "Allow to cool for at least 10 minutes before slicing thin."
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
        ListView
            {
                id: gravyHave
                width: parent.width
                height: parent.height
                clip: true
                z: 0
                opacity: 0
                model:ListModel
                {
                    ListElement
                    {
                            name: "Roast Drippings"
                            amount: "2 Tablespoons"
                    }
                    ListElement
                    {
                            name: "Corn Starch"
                            amount: "1/4 Cup"
                    }
                    ListElement
                    {
                            name: "Milk"
                            amount: "2 Cups"
                    }
                }
                delegate: ingDelegate
            }
            ListView
            {
                    id: gyroHave
                    width: parent.width
                    height: parent.height
                    clip: true
                    z: 0
                    opacity: 0
                    model:ListModel
                    {
                        ListElement
                        {
                                name: "Ground Beef"
                                amount: "1 lb"
                        }
                        ListElement
                        {
                                name: "Breadcrumbs"
                                amount: "1/2 Cup"
                        }
                        ListElement
                        {
                                name: "Garlic"
                                amount: "2 Cloves"
                        }
                        ListElement
                        {
                                name: "Oregano"
                                amount: "3 Teaspoons"
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
