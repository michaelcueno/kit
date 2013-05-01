import QtQuick 2.0

Rectangle {
    id: container
    width: 1980
    height: 1080
    color: "transparent"

    Component.onCompleted: init()

    Text
    {
        id: changeLanguagesText
        anchors {top: parent.top; topMargin: 100; left: parent.left; leftMargin: 200}
        text: "Change Language:"
        font.pixelSize: 50

    }
    Text
    {
        id: clickLanguageText
        anchors {top: parent.top; topMargin: 165; left: parent.left; leftMargin: 210}
        text: "Click on icons to change"
        font.pixelSize: 15
    }
    Rectangle
    {
        width: 750
        height: 205
        anchors {top: parent.top; topMargin: 100; left: parent.left; leftMargin: 800}
        color: "#C0C0C0"
        border.color: "teal"
        border.width: 5
        radius: 5
        ListView{
            id: languageList
            highlight: Rectangle{color: "teal" ;width: 200; height: 200}
            orientation: ListView.Horizontal
            anchors.fill: parent
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            snapMode: ListView.SnapOneItem
            model:ListModel{
                ListElement{
                    src: "qrc:/images/settings/english.png"
                }
                ListElement{
                    src: "qrc:/images/settings/spanish.png"
                }
                ListElement{
                    src: "qrc:/images/settings/swedish.png"
                }
                ListElement{
                    src: "qrc:/images/settings/french.png"
                }
                ListElement{
                    src: "qrc:/images/settings/german.png"
                }
            }
            delegate: Component{
                Rectangle{
                    height: 200
                    width: 200
                    color: "transparent"
                    Image{
                        width: parent.width
                        height: parent.height
                        source: src
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:{
                            languageList.currentIndex = index
                            translate(index)
                        }
                    }
                }
            }
        }
    }

    Text
    {
        id: changeAPIText
        anchors {top: parent.top; topMargin: 525; left: parent.left; leftMargin: 200}
        text: "Change Cooking API: "
        font.pixelSize: 50

    }
    Rectangle
    {
        id: changeCookingApi
        width: 800
        height: 50
        color: "#C0C0C0"
        border.color: "teal"
        border.width: 5
        anchors {top: parent.top; topMargin: 525; left: parent.left; leftMargin: 800}
        Text
        {
            id: apiLbl
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            height: parent.height
            text: "API Key: "
            font.pixelSize: 35
        }
        Rectangle
        {
            width: 550
            height: addUser.height
            anchors.left: parent.left
            anchors.leftMargin: 150
            color: "transparent"
            TextInput
            {
                id: changeApiInput
                text: "AKS87JS3UI34N"
                anchors.fill: parent
                font.pixelSize: 35
                anchors.top: parent.top
                anchors.topMargin: 5
                onFocusChanged: { changeApiInput.text = ""; changeApiInput.text = ""; vk.state = "open";}
                Connections {
                    target: vk
                    onSigButtonPressed: changeApiInput.text = changeApiInput.text + key;
                }

            }
        }
    }

    Text
    {
        id: changeCityText
        anchors {top: parent.top; topMargin: 625; left: parent.left; leftMargin: 200}
        text: "Change City: "
        font.pixelSize: 50

    }
    Text
    {
        id: changeCitySubText
        anchors {top: parent.top; topMargin: 685; left: parent.left; leftMargin: 200}
        text: "Type in new ciy to the right for the weather and commute applications"
        font.pixelSize: 15

    }
    Rectangle
    {
        id: changeCity
        width: 800
        height: 50
        color: "#C0C0C0"
        border.color: "teal"
        border.width: 5
        anchors {top: parent.top; topMargin: 625; left: parent.left; leftMargin: 800}
        Text
        {
            id: cityLbl
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            height: parent.height
            text: "City: "
            font.pixelSize: 35
        }
        Rectangle
        {
            width: 550
            height: addUser.height
            anchors.left: parent.left
            anchors.leftMargin: 95
            color: "transparent"
            TextInput
            {
                id:cityChangeInput
                text: "Chicago"
                anchors.fill: parent
                font.pixelSize: 35
                anchors.top: parent.top
                anchors.topMargin: 5
                onFocusChanged: {cityChangeInput.text = ""; vk.state = "open";}
                Connections {
                    target: vk
                    onSigButtonPressed: cityChangeInput.text = cityChangeInput.text + key;

                }
            }
        }
    }

    Text
    {
        id: changeMethodText
        anchors {top: parent.top; topMargin: 725; left: parent.left; leftMargin: 200}
        text: "Measurement System:"
        font.pixelSize: 50

    }
    Text
    {
        id: clickMethodText
        anchors {top: parent.top; topMargin: 785; left: parent.left; leftMargin: 210}
        text: "Click on icons to change"
        font.pixelSize: 15
    }
    Rectangle
    {
        width: 360
        height: 180
        anchors {top: parent.top; topMargin: 725; left: parent.left; leftMargin: 800}
        color: "#C0C0C0"
        border.color: "teal"
        border.width: 5
        radius: 5
        ListView{
            id: measurementMethodList
            highlight: Rectangle{color: "teal" ;width: 175; height: 175}
            orientation: ListView.Horizontal
            anchors.fill: parent
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            snapMode: ListView.SnapOneItem
            model:ListModel{
                ListElement{
                    src: "qrc:/images/settings/us-flag.png"
                }
                ListElement{
                    src: "qrc:/images/settings/un-flag.png"
                }
            }
            delegate: Component{
                Rectangle{
                    height: 175
                    width: 175
                    color: "transparent"
                    Image{
                        width: parent.width
                        height: parent.height
                        source: src
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:{
                            measurementMethodList.currentIndex = index
                        }
                    }
                }
            }
        }

    }
    Text
    {

        id: addUserText
        anchors {top: parent.top; topMargin: 400; left: parent.left; leftMargin: 200}
        text: "Add New User:"
        font.pixelSize: 50

    }
    Image
    {
        id: submit_button
        source: "qrc:/images/calc/button.png"
        anchors {top: parent.top; topMargin: 400; left: parent.left; leftMargin: 1600}
        width: 100
        height: 50
        Text
        {
            id: submit_text
            anchors.centerIn: parent
            text: "submit"
            color: "white"
            font.pixelSize: 20
            font.bold: true
        }
        MouseArea
        {
            anchors.fill: parent
            onPressed: {parent.source = "qrc:/images/calc/buttonPushed.png"; submit_text.font.pixelSize = 15}
            onReleased: {parent.source = "qrc:/images/calc/button.png"; submit_text.font.pixelSize = 20; hide_user_profiles.start()}
        }
    }
    Rectangle
    {
        id: user_profiles
        color: "#C0C0C0"
        border.color: "teal"
        border.width: 5
        anchors {top: parent.top; topMargin: 450; left: parent.left; leftMargin: 800}
        height: 0
        width: 800
        opacity: 0
        ListView
        {
            anchors.fill: parent
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            clip: true
            model:ListModel
            {
                ListElement
                {
                    src: "qrc:/images/userMenu/fb.png"
                }
                ListElement
                {
                    src: "qrc:/images/userMenu/Twitter.png"
                }
                ListElement
                {
                    src: "qrc:/images/userMenu/email.png"
                }
            }
            delegate:Component{
                    Rectangle
                    {
                        width: parent.width
                        height: 100
                        color: "#C0C0C0"
                        Image
                        {
                            width: 100
                            height: 100
                            source: src
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                        }
                        Text
                        {
                            text: "Username"
                            font.bold: true
                            font.underline: true
                            font.pixelSize: 25
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.left: parent.left
                            anchors.leftMargin: 115
                        }
                        Text
                        {
                            text: "Password"
                            font.bold: true
                            font.underline: true
                            font.pixelSize: 25
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.left: parent.left
                            anchors.leftMargin: 470
                        }
                        TextInput
                        {
                            id: user_profile_username
                            width: 350
                            anchors.left: parent.left
                            anchors.leftMargin: 115
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 5
                            font.pixelSize: 50
                            onFocusChanged: {user_profile_username.text = ""; vk.state = "open";}
                            Connections {
                                target: vk
                                onSigButtonPressed: user_profile_username.text = user_profile_username.text + key;
                            }
                        }
                        TextInput
                        {
                            id: user_profile_password
                            width: 350
                            anchors.left: parent.left
                            anchors.leftMargin: 470
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 5
                            font.pixelSize: 50
                            onFocusChanged: {user_profile_password.text = ""; vk.state = "open";}
                            Connections {
                                target: vk
                                onSigButtonPressed: user_profile_password.text = user_profile_password.text + key;
                            }
                        }
                        MouseArea
                        {
                            anchors.fill: user_profile_username
                            onClicked:{
                                user_profile_username.forceActiveFocus()
                            }
                        }
                }
            }
        }
        ParallelAnimation
        {
            id: show_user_profiles
            PropertyAnimation
            {
                target: user_profiles
                properties: "height"
                to: 305
                duration: 300
            }
            PropertyAnimation
            {
                target: user_profiles
                properties: "opacity"
                to: 1
                duration: 300
            }
        }
        ParallelAnimation
        {
            id: hide_user_profiles
            PropertyAnimation
            {
                target: user_profiles
                properties: "height"
                to: 0
                duration: 300
            }
            PropertyAnimation
            {
                target: user_profiles
                properties: "opacity"
                to: 0
                duration: 150
            }
        }
    }
    Rectangle
    {
        id: addUser
        width: 800
        height: 50
        color: "#C0C0C0"
        border.color: "teal"
        border.width: 5
        anchors {top: parent.top; topMargin: 400; left: parent.left; leftMargin: 800}
        Text
        {
            id: userLbl
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            height: parent.height
            text: "User name:"
            font.pixelSize: 35
        }
        Rectangle
        {
            width: 550
            height: addUser.height
            anchors.left: parent.left
            anchors.leftMargin: 210
            color: "transparent"
            TextInput
            {
                anchors.fill: parent
                font.pixelSize: 35
                anchors.top: parent.top
                anchors.topMargin: 5
                onFocusChanged: { show_user_profiles.start(); show_user_profiles.text = ""; vk.state = "open";}
                Connections {
                    target: vk
                    onSigButtonPressed: show_user_profiles.text = show_user_profiles.text + key;
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

    function translate(number)
    {
        switch(number)
        {

            case 0:
                addUserText.text = "Add New User: "
                changeAPIText.text = "Change Cooking API:"
                changeCityText.text = "Change City:"
                changeCitySubText.text = "Type in new ciy to the right for the weather and commute applications"
                changeLanguagesText.text = "Change Language:"
                changeMethodText.text = "Measurement System:"
                clickLanguageText.text = "Click on icons to change"
                clickMethodText.text = "Click on icons to change"
                break;
            case 1:
                addUserText.text ="Agrega Usuario Nuevo:"
                changeCityText.text = "Cambiar Ciudad:"
                changeCitySubText.text = "Escriba ciudad nueva a la derecha"
                changeAPIText.text = "Cambiar API:"
                changeLanguagesText.text = "Cambiar el Idomia:"
                changeMethodText.text = "Cambiar el Sistema:"
                clickLanguageText.text = "Clic en el icono para cambiar"
                clickMethodText.text = "Clic en el icono para cambiar"
                break;
            case 2:
                addUserText.text = "Lägg till Användare:"
                changeCityText.text = "Ändra Stad:"
                changeCitySubText.text = "Skriv in ny stad till höger för vädret och pendla applikationer"
                changeAPIText.text = "Ändra API:"
                changeLanguagesText.text = "Ändra Språk:"
                changeMethodText.text = "Mätsystem:"
                clickLanguageText.text = "Klicka på ikonen för att ändra"
                clickMethodText.text = "Klicka på ikonen för att ändra"
                break;
            case 3:
                addUserText.text = "Ajouter un Utilisateur:"
                changeCityText = "Changer ville:"
                changeCitySubText = "Tapez nouveau ciy vers la droite"
                changeAPIText.text = "Changer API:"
                changeLanguagesText.text = "Changer la Langue:"
                changeMethodText.text = "Système de Mesure:"
                clickLanguageText.text = "Cliquez sur l'icône pour changer"
                clickMethodText.text = "Cliquez sur l'icône pour changer"
                break;
            case 4:
                addUserText.text = "Benutzer Hinzufügen:"
                changeCityText.text = "Ändern Stadt:"
                changeCitySubText.text = "Type in neue Stadt auf der rechten Seite"
                changeAPIText.text = "Ändern API:"
                changeLanguagesText.text = "Ändern Sprache:"
                changeMethodText.text = "Messsystem:"
                clickLanguageText.text = "Klicken Sie das Symbol ändern"
                clickMethodText.text = "Klicken Sie das Symbol ändern"
                break;
        }
    }
}
