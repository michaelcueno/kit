/**
 *  QML Virtual Keyboard main file
 *  Copyright © 2012 Pavel Ustinov aka rotoZOOM
 *
 *  All rights reserved.
 *
 */
import QtQuick 2.0

Rectangle {
    id: root
    property Style style : Style { }    // inspired by colibri keyboard

    width: 800
    height: 260
    color: style.col_background

    signal sigButtonPressed (string key) // signal what key was pressed for outside use, just connect it
    signal sigStickedButtonLatched (string special_key) // special(sticked) key latched event (ctrl,shift,alt,capslock etc)
    signal sigStickedButtonUnlatched (string special_key) // special(sticked) key unlatched event (ctrl,shift,alt,capslock etc)

    onWidthChanged: checkOutSizes()
    onHeightChanged: checkOutSizes()

    Component.onCompleted: {
        shift_button.sigState.connect(shiftPressed)
        lang_switcher.sigLanguageSwitch.connect (rusLatPressed)
        root.sigButtonPressed.connect (buttonPressed)   // only for test purposes
        walkThroughKeyboard (function(key)
                             {
                                 if (key.sigState !== undefined)
                                 {
                                     /// sticked key
                                     key.sigState.connect(stickedButtonClicked)
                                 }
                                 else
                                 {
                                     key.sigButtonPressed.connect(sigButtonPressed)
                                 }
                             }
                             )
    }

    Column {
        id: keyboard
        spacing: style.row_spacing
        Row {
            id: row1
            spacing: style.col_spacing
            Button { style: root.style; label_en: "Esc"; id: escape_button; fixed: true; grad: style.grad_but_esc; special: "esc" }
            Button { style: root.style; label_en: "`"; shift_label_en: "~"; label_ru: "ё"; shift_label_ru: "Ё" }
            Button { style: root.style; label_en: "1"; shift_label_en: "!"; label_ru: "1"; shift_label_ru: "!" }
            Button { style: root.style; label_en: "2"; shift_label_en: "@"; label_ru: "2"; shift_label_ru: "\"" }
            Button { style: root.style; label_en: "3"; shift_label_en: "#"; label_ru: "3"; shift_label_ru: "№" }
            Button { style: root.style; label_en: "4"; shift_label_en: "$"; label_ru: "4"; shift_label_ru: ";" }
            Button { style: root.style; label_en: "5"; shift_label_en: "%"; label_ru: "5"; shift_label_ru: "%" }
            Button { style: root.style; label_en: "6"; shift_label_en: "^"; label_ru: "6"; shift_label_ru: ":" }
            Button { style: root.style; label_en: "7"; shift_label_en: "&"; label_ru: "7"; shift_label_ru: "?" }
            Button { style: root.style; label_en: "8"; shift_label_en: "*"; label_ru: "8"; shift_label_ru: "*" }
            Button { style: root.style; label_en: "9"; shift_label_en: "("; label_ru: "9"; shift_label_ru: "(" }
            Button { style: root.style; label_en: "0"; shift_label_en: ")"; label_ru: "0"; shift_label_ru: ")" }
            Button { style: root.style; label_en: "-"; shift_label_en: "_"; label_ru: "-"; shift_label_ru: "_" }
            Button { style: root.style; label_en: "="; shift_label_en: "+"; label_ru: "="; shift_label_ru: "+" }
            Button { style: root.style; label_en: "<html>&larr;</html>"; width: style.but_width_and_half; fixed: true; special: "backspace" }
        }
        Row {
            id: row2
            spacing: root.style.col_spacing
            anchors.left: parent.left
            anchors.leftMargin: root.style.but_width
            Button { style: root.style; label_en: "q"; shift_label_en: "Q"; label_ru: "й"; shift_label_ru: "Й" }
            Button { style: root.style; label_en: "w"; shift_label_en: "W"; label_ru: "ц"; shift_label_ru: "Ц" }
            Button { style: root.style; label_en: "e"; shift_label_en: "E"; label_ru: "у"; shift_label_ru: "У" }
            Button { style: root.style; label_en: "r"; shift_label_en: "R"; label_ru: "к"; shift_label_ru: "К" }
            Button { style: root.style; label_en: "t"; shift_label_en: "T"; label_ru: "е"; shift_label_ru: "Е" }
            Button { style: root.style; label_en: "y"; shift_label_en: "Y"; label_ru: "н"; shift_label_ru: "Н" }
            Button { style: root.style; label_en: "u"; shift_label_en: "U"; label_ru: "г"; shift_label_ru: "Г" }
            Button { style: root.style; label_en: "i"; shift_label_en: "I"; label_ru: "ш"; shift_label_ru: "Ш" }
            Button { style: root.style; label_en: "o"; shift_label_en: "O"; label_ru: "щ"; shift_label_ru: "Щ" }
            Button { style: root.style; label_en: "p"; shift_label_en: "P"; label_ru: "з"; shift_label_ru: "З" }
            Button { style: root.style; label_en: "["; shift_label_en: "{"; label_ru: "х"; shift_label_ru: "Х" }
            Button { style: root.style; label_en: "]"; shift_label_en: "}"; label_ru: "ъ"; shift_label_ru: "Ъ" }
        }
        Row {
            id: row3
            spacing: style.col_spacing
            anchors.left: parent.left
            anchors.leftMargin: root.style.but_width_and_half
            Button { style: root.style; label_en: "a"; shift_label_en: "A"; label_ru: "ф"; shift_label_ru: "Ф" }
            Button { style: root.style; label_en: "s"; shift_label_en: "S"; label_ru: "ы"; shift_label_ru: "Ы" }
            Button { style: root.style; label_en: "d"; shift_label_en: "D"; label_ru: "в"; shift_label_ru: "В" }
            Button { style: root.style; label_en: "f"; shift_label_en: "F"; label_ru: "а"; shift_label_ru: "А" }
            Button { style: root.style; label_en: "g"; shift_label_en: "G"; label_ru: "п"; shift_label_ru: "П" }
            Button { style: root.style; label_en: "h"; shift_label_en: "H"; label_ru: "р"; shift_label_ru: "Р" }
            Button { style: root.style; label_en: "j"; shift_label_en: "J"; label_ru: "о"; shift_label_ru: "О" }
            Button { style: root.style; label_en: "k"; shift_label_en: "K"; label_ru: "л"; shift_label_ru: "Л" }
            Button { style: root.style; label_en: "l"; shift_label_en: "L"; label_ru: "д"; shift_label_ru: "Д" }
            Button { style: root.style; label_en: ";"; shift_label_en: ":"; label_ru: "ж"; shift_label_ru: "Ж" }
            Button { style: root.style; label_en: "'"; shift_label_en: "\""; label_ru: "э"; shift_label_ru: "Э" }
            Button { style: root.style; label_en: "\\"; shift_label_en: "|"; label_ru: "\\"; shift_label_ru: "/" }
            Button { style: root.style; label_en: "Enter"; width: style.but_width_and_half; fixed: true; special: "enter" }
        }
        Row {
            id: row4
            spacing: style.col_spacing
            StickedButton { style: root.style; id: shift_button; label_en: "<html>&uarr;</html>"; width: style.but_doubled_width; fixed: true; special: "shift" }
            Button { style: root.style; label_en: "z"; shift_label_en: "Z"; label_ru: "я"; shift_label_ru: "Я" }
            Button { style: root.style; label_en: "x"; shift_label_en: "X"; label_ru: "ч"; shift_label_ru: "Ч" }
            Button { style: root.style; label_en: "c"; shift_label_en: "C"; label_ru: "с"; shift_label_ru: "С" }
            Button { style: root.style; label_en: "v"; shift_label_en: "V"; label_ru: "м"; shift_label_ru: "М" }
            Button { style: root.style; label_en: "b"; shift_label_en: "B"; label_ru: "и"; shift_label_ru: "И" }
            Button { style: root.style; label_en: "n"; shift_label_en: "N"; label_ru: "т"; shift_label_ru: "Т" }
            Button { style: root.style; label_en: "m"; shift_label_en: "M"; label_ru: "ь"; shift_label_ru: "Ь" }
            Button { style: root.style; label_en: ","; shift_label_en: "<"; label_ru: "б"; shift_label_ru: "Б" }
            Button { style: root.style; label_en: "."; shift_label_en: ">"; label_ru: "ю"; shift_label_ru: "Ю" }
            Button { style: root.style; label_en: "/"; shift_label_en: "?"; label_ru: "."; shift_label_ru: "," }
        }
        Row {
            id: row5
            spacing: style.col_spacing
            StickedButton { style: root.style; id: ctrl_button; label_en: "Ctrl"; width: style.but_doubled_width; fixed: true; special: "ctrl" }
            StickedButton { style: root.style; id: alt_button; label_en: "Alt"; fixed: true; special: "alt" }
            RusLatButton { style: root.style; id: lang_switcher}
            Button { style: root.style; id: space_button; width: style.but_doubled_width*4; fixed: true; special: "space" }
        }
    }

    Column {
        id: arrow_keys
        anchors.right: keyboard.right
        anchors.bottom: keyboard.bottom
        spacing: root.style.row_spacing
        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            Button { style: root.style; label_en: "<html>&uarr;</html>"; special: "up"; fixed: true }
        }
        Row {
            spacing: root.style.col_spacing
            Button { style: root.style; label_en: "<html>&larr;</html>"; special: "left"; fixed: true }
            Button { style: root.style; label_en: "<html>&darr;</html>"; special: "down"; fixed: true }
            Button { style: root.style; label_en: "<html>&rarr;</html>"; special: "right"; fixed: true }
        }
    }

    /**
     * Test function TODO: remove from release
     */
    function buttonPressed (key)
    {
        console.log (key)
    }

    function stickedButtonClicked (key, is_checked)
    {
        console.log ([key,is_checked])  /// for debugging purpose TODO: remove from release
        if (is_checked)
        {
            sigStickedButtonLatched (key)
        }
        else
        {
            sigStickedButtonUnlatched (key)
        }
    }

    /**
     * Shift press/release handler
     */
    function shiftPressed (key, is_checked)
    {
        walkThroughKeyboard (function(key){
                                 if (!key.fixed)
                                 {
                                     key.changeShiftState (is_checked)
                                 }
                             })
    }

    /**
     * Language switch key pressed
     */
    function rusLatPressed (lng)
    {
        walkThroughKeyboard (function(key){
                                 if (!key.fixed)
                                 {
                                     key.lang = lng == "ru" ? "ru" : "en"
                                 }
                             })
    }

    /**
     * Walk through all keys and invoke visitor function on each key
     */
    function walkThroughKeyboard (visitor)
    {
        var i, j, row, key;     // it's my paranoya from C++ :)

        for (i = 0 ; i < keyboard.children.length ; i++)
        {
            row = keyboard.children[i];
            for (j = 0 ; j < row.children.length ; j++)
            {
                key = row.children[j];
                visitor (key)   /// call user function
            }
        }
        for (i = 0 ; i < arrow_keys.children.length ; i++)
        {
            row = arrow_keys.children[i];
            for (j = 0 ; j < row.children.length ; j++)
            {
                key = row.children[j];
                visitor (key)   /// call user function
            }
        }
    }

    /**
     * Correct button's size depends on pane width and height
     * P.S. the worst place in code (ughhh so ugly), must to do it more nicely!!!
     */
    function checkOutSizes ()
    {
        /// calculate base button width
        /// it bases on the most lengthy row (number 1 at the moment),
        /// 14 normal and one long keys
        var x = Math.round((root.width - 14 * style.col_spacing) / 15.5) - 1;
        style.but_width = Math.max (x,style.min_but_width);
        /// calculate base button height
        x = Math.round((root.height - 4 * style.row_spacing) / 5) - 1;
        style.but_height = Math.max(x,style.min_but_height);
    }
}
