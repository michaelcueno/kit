/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0

Rectangle {
    id: container

    signal clicked

    property string text
    property color clickColor
    property color hoverColor
    property color textColor
    width: buttonText.width + 28
    height: buttonText.height + 14
    radius: 15


    /*BorderImage {
        id: buttonImage
        //source: "images/spiderman.jpg"
        opacity: 0.8
        width: 200
        height: 130
    }*/
    /*BorderImage {
        id: pressed
        opacity: 0
        source: "images/toolbutton.sci"
        width: container.width - 10
        height: container.height
    }*/
    MouseArea {
        id: mouseRegion
        anchors.fill: container
        hoverEnabled: true
        onClicked: { container.clicked(); vk.state = "open" }
    }
    Text {
        id: buttonText
        color: textColor
        anchors.centerIn: container
        font.bold: true
        font.pointSize: 15
        text: container.text
        style: Text.Raised
        styleColor: "black"
    }
    states: [
        State {
            name: "Pressed"
            when: mouseRegion.pressed == true
            PropertyChanges { target: buttonText; color: "gray" }
            PropertyChanges { target: container; color: container.clickColor}
        },
        State {
            name: "Hovered"
            when: mouseRegion.containsMouse == true
            PropertyChanges { target: container; color: container.hoverColor}
        }

    ]
    transitions: [
        Transition { from: "*"
            to: "Pressed"
            PropertyAnimation { target: buttonText; property: "color"; duration: 100; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: container; property: "color"; duration: 100; easing.type: Easing.InOutQuad}
        },
        Transition { from: "Pressed"
            to: "*"
            PropertyAnimation { target: buttonText; property: "color"; duration: 100; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: container; property: "color"; duration: 100; easing.type: Easing.InOutQuad}
        },
        Transition {
            from: "*"
            to: "Hovered"
            PropertyAnimation { target: container; property: "color"; duration: 200; easing.type: Easing.InOutQuad}
        },
        Transition {
            from: "Hovered"
            to: "*"
            PropertyAnimation { target: container; property: "color"; duration: 200; easing.type: Easing.InOutQuad}
        }
    ]
}
