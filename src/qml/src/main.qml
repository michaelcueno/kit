import QtQuick 2.0

/** Container for the main application. All main animations and navigation should be specified by functions in
        this file. Then you can change the screen in any other file by calling main.move_to( <whatever> ); */
Item {
    id: main
    width: 1920
    height: 1080

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
            mainWindow.x = -1920; mainWindow.y = 0;
            break;
        case cabinets:
        mainWindow.x = 0; mainWindow.y = -1080;
            break;
        case cooking:
        mainWindow.x = 1920; mainWindow.y = 0;
            break;
        case mainWindow:
        mainWindow.x = 0; mainWindow.y = 0;
            break;

        }
    }
}
