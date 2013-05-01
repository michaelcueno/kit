/**
 * Base class for button
 */
import QtQuick 2.0

Rectangle {
    property Style style : undefined    // must be setted by owner

    id: button_pane
    width: style.but_width
    height: style.but_height
    smooth: true
    border.width: 1
    border.color: style.col_but_border
    radius: style.but_outer_radius
    state: "plain"

    property string lang: "en"
    property bool fixed: false      //!< is animation available in transition from state to state
    property string label_en: ""
    property string shift_label_en: ""
    property string label_ru: ""
    property string shift_label_ru: ""
    property string en_label: ""
    property string ru_label: ""
    property string special: ""
    property Gradient grad: style.grad_but_def

    signal sigButtonPressed(string key)

    /**
     * Obtain current Key
     */
    function currentKey()
    {
        if (button_pane.special != "")
        {
            return button_pane.special;
        }
        return button_pane.lang == "en" ? text_label_en.text : text_label_ru.text;
    }

    /**
     * Change language handler
     */
    function changeLanguage()
    {
        text_label_en.state = lang == "en" ? "active" : "inactive"
        text_label_ru.state = lang == "ru" ? "active" : "inactive"
    }

    /**
     * Change shift state handler, invoked by owner
     */
    function changeShiftState (pressed)
    {
        text_label_en.text = pressed ? shift_label_en : label_en ;
        text_label_ru.text = pressed ? shift_label_ru : label_ru ;
    }

    onLangChanged: {
        if (!fixed)
        {
            changeLanguage()
        }
    }

    Component.onCompleted: {
        // initializing
        changeLanguage();
        changeShiftState (false);
    }

    states: [
        State {
            name: "plain"
            PropertyChanges {
                target: text_label_en
                state: "active"
            }
            PropertyChanges {
                target: text_label_ru
                state: "inactive"
            }
        },
        State {
            name: "shifted"
            PropertyChanges {
                target: text_label_en
                state: "inactive"
            }
            PropertyChanges {
                target: text_label_ru
                state: "active"
            }
        }
    ]

    transform: Scale {
        id: scaling_factor
        origin.x: button_pane.width / 2
        origin.y: button_pane.height
        xScale: 1.0
        yScale: 1.0
    }

    Rectangle {
        id: contento
        anchors.fill: parent
        anchors.leftMargin: 2
        anchors.rightMargin: 1
        anchors.topMargin: 2
        anchors.bottomMargin: 1
        radius: root.style.but_outer_radius - 2
        smooth: true

        gradient: button_pane.grad
        KeyLabel {
            id: text_label_en
            text: button_pane.label_en
            state: "active"
            cstyle: button_pane.style
        }
        KeyLabel {
            id: text_label_ru
            text: button_pane.label_ru
            state: "inactive"
            cstyle: button_pane.style
        }
        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                button_pane.border.color = root.style.col_but_border_hovered
            }
            onExited: {
                button_pane.border.color = root.style.col_but_border
            }

            onPressed:
             {
                button_pane.sigButtonPressed (button_pane.currentKey());
                click_animation.start();
            }
        }
    }

    SequentialAnimation {
        id: click_animation

/**
 * For future purposes, for example for handling of the end of animation
        signal sigAnimationStop

        onRunningChanged: {
            if (!running)
            {
                sigAnimationStop()
            }
        }
*/
        PropertyAnimation {
            target: button_pane
            property: "z"
            to: 100
            duration: 0
        }
        ParallelAnimation {
            PropertyAnimation {
                target: scaling_factor
                property: "xScale"
                from: 1.0
                to: 1.2
                duration: 100
            }
            PropertyAnimation {
                target: scaling_factor
                property: "yScale"
                from: 1.0
                to: 2
                duration: 100
            }
            PropertyAnimation {
                target: button_pane
                property: "opacity"
                from: 1.0
                to: 0.75
                duration: 100
            }
        }
        ParallelAnimation {
            PropertyAnimation {
                target: scaling_factor
                property: "xScale"
                from: 1.2
                to: 1.0
                duration: 100
            }
            PropertyAnimation {
                target: scaling_factor
                property: "yScale"
                from: 2
                to: 1.0
                duration: 100
            }
            PropertyAnimation {
                target: button_pane
                property: "opacity"
                from: 0.75
                to: 1.0
                duration: 100
            }
        }
        PropertyAnimation {
            target: button_pane
            property: "z"
            to: 0
            duration: 0
        }
    }
}
