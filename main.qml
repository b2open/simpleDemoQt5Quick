import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    visibility: "Maximized"

    SwipeView {
        id: swipeView
        anchors.fill: parent

        Page1 { }

    }

}
