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
    Shade {id: shade }  // not really an app, but must be placed under weather for layering reasons
    ClockApp { id: clockApp; anchors.top: mainWindow.top; anchors.left: mainWindow.left}
    User { id: cur_user; anchors.top:mainWindow.top; anchors.left: mainWindow.left}

    // Will contain the blinds and the window-sill
    MainWindow {id: mainWindow; x:0; y:0}

    // Swipe from right to left
    Fridge {id: fridge; anchors {top: mainWindow.top; left: mainWindow.right } }

    // Swipe from left to right
    Cabinets {id: cabinets; anchors {top: mainWindow.bottom; left: mainWindow.left } }

    // Swipe from down to up
    Cooking {id: cooking; anchors {right: mainWindow.left; top: mainWindow.top } }

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
        move_to(mainWindow);
        mainWindow.pull_blinds("up");
        if(app === cur_user)
            pull_down_shade();

        app.state = "focused";
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
        clockApp.state = "hidden"
        cur_user.state = "hidden"
        // add apps in here as you add them to the project
    }

    function pull_down_shade(){
        shade.state = "focused"
    }

    function pull_up_shade(){
        shade.state = "hidden"
    }
}
