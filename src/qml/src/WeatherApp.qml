/****************************************************************************
**
** Copyright (C) 2012 Michael Cueno.
** Contact: mcueno2@uic.edu
**
** This is the main QML file for the WeatherStation application developed for
** User Interface Design (CS422) @ UIC
**
**
****************************************************************************/

import QtQuick 2.0
import "weatherapp"

Item { id: container

    property int metric: 0               // 0 = farenheit / 1 = celcius
    property int language: 1             // 1 = English / 2 = Swedish
    property string bg_source: ""        // Source image for background
    property string current_city: ""     // contains the name of the current city
    property int cur_time                // Hour 1-24 (constant)
    property int cosmo_constant          // Used for positioning the sun/moon (Based off the cur_time)

    Component.onCompleted: init()

    width: 1920
    height: 1280

    Text { id: city_name
        text: current_city
        font.pixelSize: 30
        x: 180; y: -100;
        color: (main.daytime==0)? "white":"black"
    }

    // Includes Temp, day, condition.. etc. Center of the screen in the main view
    MainStats { id: main_stats;
        x: (parent.width / 2 ) - (main_stats.width / 2)
        y: -200
        onCompleted: swiper.populate_hours(main_stats.num_hours, cur_time)
        transitions: Transition {
            PropertyAnimation { properties: "x,y,visible"; easing.type: Easing.InOutQuad }
        }
    }

    Image { id: cosmic_object   // either the sun or the moon
        source: (main.daytime==0)?"qrc:/weather/images/weather//moon_unit.png":"qrc:/weather/images/weather/sun.png"
        y: {var time = (swiper.index%12);
            var offset = time-7;
            if(offset==0){return mainWindow.height+500;}
            if(offset<0){
                offset = time + 5;
            }
            return ((mainWindow.height/11)*offset) - 200
        }
        x: mainWindow.width * (5/7)
    }

    /* Settings/Dashboard accessor
    Image { id: drag_hook
        anchors {top: parent.top; horizontalCenter: parent.horizontalCenter }
        anchors.bottomMargin: drag_hook.height/2
        source: "qrc:/weather/images/weather/dragger.png"

        MouseArea { id: dash_mouse_area
            anchors.fill: parent
            onClicked: dash.state = (dash.state==="focused")? "" : "focused";
            enabled: (dash.state==="focused")? false: true;
        }
    }
    */

    // Hourly swiper that changes the hourly stats in mainStats
    Swiper {id: swiper;
        y:1300
        x:0
    }

    Text { id: indoor
        text: (metric == 0)?"Indoor Temp: 72\u00b0f":"Indoor Temp: 22\u00b0c"
        color: (main.daytime==0)?"white":"black"
        font.pixelSize: 25
        anchors {bottom: parent.bottom; bottomMargin: 20; horizontalCenter: parent.horizontalCenter }
    }

    // Settings and cities view (this is where the user can change the city to focus on)
    //DashBoard {id: dash; state: ""}

    states: [
    State { name: "focused"
            PropertyChanges {
                target: container;
            }
            PropertyChanges {
                target: main_stats; y: 200
            }
            PropertyChanges {
                target: swiper; y:800
            }
            PropertyChanges {
                target: city_name; y:100
            }
    },
    State { name: "hidden"
            PropertyChanges {
                target: container;
            }
            PropertyChanges {
                target: main_stats; y: -400
            }
            PropertyChanges {
                target: swiper; y: 1300
            }
            PropertyChanges {
                target: city_name; y:-200
            }
    }
    ]
    transitions: Transition {
        PropertyAnimation { properties: "x,y"; easing.type: Easing.Linear }
    }

    function init(){
        //main_stats.load("60607",0)  // Downloads json and sets environment variables
        current_city = "Chicago"

        //Uncomment for populated hours and data when not connected to api
        swiper.populate_hours(240, 1)
        main_stats.synthData()
        container.state = "hidden"
        main.weather_src = "qrc:/weather/images/weather/clear_blue_sky.jpg"

        //Tr.tr("This is a test string", "English", "Spanish")
    }

//    function reDraw(){
//        weather_bg.source = (main.daytime==0)?"qrc:/weather/images/weather/bgs/night-sky.png":"qrc:/weather/images/weather/clear_blue_sky.jpg"
//   }

    function reset(){
        swiper.set_day(0);
    }

    function re_draw(){
        main_stats.setBackground()
    }
}
