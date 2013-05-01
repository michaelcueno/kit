/** Main QML file for the project.
    ToDo: Figure out how to implement users.
        - User class, instantiate a new user for each user
            + Would need all user specific data to be conatined inside the user class?
            +
*/

import QtQuick 2.0
import "clock"
import "user"
import "main"
import "music"
import "homeauto"
import "fridge"
import "CabinetPanel"
import "keyboard"
import QtMultimedia 5.0

/** Container for the main application. All main animations and navigation should be specified by functions in
        this file. Then you can change the screen in any other file by calling main.move_to( <whatever> ); */
Item {
    id: main
    width: 1920
    height: 1080

    // This is the backround depicting the current weather, it is changed by
    // the weather app
    Image { id: weather_bg
        source: "qrc:/weather/images/weather/clear_blue_sky.jpg"
    }

    // Initialize apps
    WeatherApp { id: weatherApp; anchors.top: mainWindow.top; anchors.left: mainWindow.left }
    UserScreen{id: userScreen; anchors.top:mainWindow.top; anchors.left: mainWindow.left }
    Shade {id: shade }  // not really an app, but must be placed under weather for layering reasons
    Calculator{ id: calc; anchors.top:mainWindow.top; anchors.left: mainWindow.left }
    MusicApp { id: music; anchors.top:mainWindow.top; anchors.left: mainWindow.left }
    ClockApp { id: clockApp; anchors.top: mainWindow.top; anchors.left: mainWindow.left}
    HomeAutoApp { id: homeauto; anchors.top: mainWindow.top; anchors.left: mainWindow.left}
    Commuting { id: commute; anchors.top: mainWindow.top; anchors.left: mainWindow.left}
    

    ScreenSaver{id: screenSaver; anchors.top:mainWindow.top; anchors.left: mainWindow.left}
    Settings{id: settings; anchors.top:mainWindow.top; anchors.left: mainWindow.left}
    
    // Will contain the blinds and the window-sill
    MainWindow {id: mainWindow; x:0; y:0; z: 10000}

    // Swipe from right to left
    Fridge {id: fridge; z: 10000; anchors {top: mainWindow.top; left: mainWindow.right } }

    // Swipe from left to right
    CabinetPanel {id: cabinets; z: 10000;  anchors {top: mainWindow.bottom; left: mainWindow.left } }

    // Swipe from down to up
    Cooking {id: cooking; z: 10000; anchors {right: mainWindow.left; top: mainWindow.top } }

    VirtualKeyboard {id: vk; x: 400; y : 1080
        states: State { name: "open"; PropertyChanges {
                target: vk
                y: 700; z:10000
            }}
        transitions: Transition {
            PropertyAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
        }
    }

    // Animation Function (Switching between the four different kitchen views
    function move_to( screen )
    {
        switch (screen){
        case fridge:
        mainWindow.state = "fridge"
            break;
        case cabinets:
        mainWindow.state = "cabinet"
            break;
        case cooking:
        mainWindow.state = "cooking"
            break;
        case mainWindow:
        mainWindow.state = "centered"
            break;

        }
    }

    // Use this function to open a focused view of a widget, pass in the widget id in string form
    function open( app ){
        close_apps();
        move_to(mainWindow)
        if(mainWindow.indicator == 0)
            mainWindow.pull_blinds("up");
        app.state = "focused";
        app.z = 1000;
    }

    // Login a user, calls a c++ method that loads users settings from a QSettings object
    function login(user){
        user.login(user);
    }

    // Function that is called when pull string is clicked
    function logout(){
        close_apps();
        mainWindow.pull_blinds("down");
    }

    // Closes view of app in the mainwindow,
    function close_apps(){
        pull_up_shade();
        weatherApp.state = "hidden"
        weatherApp.z = 0;
        clockApp.state = "hidden"
        clockApp.z = 0;
        userScreen.state = "hidden"
        userScreen.z = 0;
        calc.state = "hidden"
        calc.z = 0;
        music.state = "hidden"
        music.z = 0;
        homeauto.state = "hidden"
        homeauto.z = 0;
        screenSaver.state = "hidden"
        screenSaver.z = 0;
        settings.state = "hidden"
        settings.z = 0;
        screenSaver.state = "hidden"
        screenSaver.z = 0;
        screenSaver.state = "hidden"
        settings.state = "hidden"
        commute.state = "hidden"

        // add apps in here as you add them to the project
    }

    function pull_down_shade(){
        shade.state = "focused"
    }

    function pull_up_shade(){
        shade.state = "hidden"
    }
}
