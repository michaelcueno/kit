// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

Button {
    property bool is_pressed: false
    signal sigState(string key, bool state)

    MouseArea {
        anchors.fill: parent
        onPressed: {
            is_pressed = !is_pressed
            if (is_pressed)
            {
                grad = style.grad_but_sticked
            }
            else
            {
                grad = style.grad_but_def
            }

            sigState(currentKey(), is_pressed)
        }
    }
}
