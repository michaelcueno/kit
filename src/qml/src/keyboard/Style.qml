/**
 * Adopt from CLStyle.qml (colibri) by Digia PLC
 * Use this file for theme settings
 */
import QtQuick 2.0

Item {
//    SystemPalette {id: palette}                           // haven't use it yet
    property Gradient grad_but_def: Gradient {
        GradientStop { position: 0; color: "#8888ff" }
        GradientStop { position: 1; color: "#2020ff" }
    }
    property Gradient grad_but_esc: Gradient {
        GradientStop { position: 0; color: "#6666bb" }
        GradientStop { position: 1; color: "#111166" }
    }
    property Gradient grad_but_sticked: Gradient {
        GradientStop { position: 0; color: "#ffff88" }
        GradientStop { position: 1; color: "#888820" }
    }

    property color col_label_def: "white"
    property color col_label_inactive: "#aaaaaa"
    property color col_label_active: "#ffff80"
    property color col_background: "#8888ff"
    property color col_but_border: "#2020ff"
    property color col_but_border_hovered: "#a0a0ff"
    property int but_outer_radius: 10

    property int min_but_width: 48                              // minimal button width
    property int min_but_height: 48                             // and of course minimal button height
    property int col_spacing: 4                                 // spacing between columns
    property int row_spacing: 4                                 // spacing between rows
    property int but_width: 100                                 // default button width
    property int but_width_and_half: but_width*1.5              // button width and a half
    property int but_doubled_width: but_width*2                 // button doubled width
    property int but_height: 64                                 // button height
    property real font_size: Math.min(but_width,but_height) / 3 //!< font size
    property real font_small_size: font_size-5                  //!< font size for small label
}
