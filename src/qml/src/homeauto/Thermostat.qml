import QtQuick 2.0

Item {

    property int temp: 72
    property int metric: 1   // 1 = US, 0 = metric
    id: thermostat
    width: 400; height: 400



    Image { id: thermo_bg
        source: "/home/mike/School/ui-CS422/kit/src/images/homeauto/thermostat.png"
    }

    Image { id: slider
        source: "/home/mike/School/ui-CS422/kit/src/images/homeauto/slider.png"
        x: 300; y: 40
        states: State { name: "colder"; PropertyChanges {target: slider; x:336; y:55 }}
        transitions: Transition {
            PropertyAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
        }
    }

    Image{ id: heat_icn
        source: "/home/mike/School/ui-CS422/kit/src/images/homeauto/heat.gif"
        x: 160; y: 330
    }

    Image { id: cool_icn
        source: "/home/mike/School/ui-CS422/kit/src/images/homeauto/chill_off.gif"
        x: 310; y:330
    }

    Text {
        text: temp + "\u00b0"
        font.pixelSize: 120
        color: "white"
        x: 180; y: 200
    }

    function temp_down(){
        slider.state = "colder"
        cool_icn.source = "/home/mike/School/ui-CS422/kit/src/homeauto/chill.gif"
        heat_icn.source = "/home/mike/School/ui-CS422/kit/src/homeauto/heat_off.gif"
        temp = 68
    }

    function temp_up(){
        slider.state = ""
        heat_icn.source = "/home/mike/School/ui-CS422/kit/src/images/homeauto/heat.gif"
        cool_icn.source = "/home/mike/School/ui-CS422/kit/src/images/homeauto/chill_off.gif"
        temp = 72
    }
}
