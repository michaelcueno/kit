/**
  Next Track: a queue of tracks to play next, double clicking on songs in Songs list will add them here
  */

import QtQuick 2.0

Rectangle {
    width: 800
    height: 120

    color: "white"

    ListModel { id: next_songs
    }


}
