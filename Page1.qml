import QtQuick 2.7
import QtQuick.Controls 2.0

Item {
    id: p1

    property int hours
    property int minutes
    property int seconds
    property bool night: false

    property color background: "gray"

    function timeChanged() {
        var date = new Date;
        hours = date.getHours()
        night = ( hours < 7 || hours > 19 )
        minutes = date.getMinutes()
        seconds = date.getUTCSeconds();
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: p1.timeChanged()
    }

    FontLoader { id: robotoThin;    source: "FONT/roboto/Roboto-Thin.ttf" }


    Rectangle {
        anchors.fill: parent
        color: Qt.darker(p1.background)

        Row {
            anchors.fill: parent

            Rectangle {
                width: parent.width/2
                height: parent.height
                color: Qt.darker(p1.background)

                Rectangle {
                    id: rectWhite

                    width: 300
                    height: 300
                    anchors.verticalCenter: parent.verticalCenter
                    x: -width/2
                    color: Qt.lighter("lightgray")
                    rotation: 45

                    Behavior on width {
                        NumberAnimation { duration: 1000 }
                    }
                    Behavior on height {
                        NumberAnimation { duration: 1000 }
                    }
                    Behavior on rotation {
                        NumberAnimation { duration: 1000 }
                    }
                    Behavior on x {
                        NumberAnimation { duration: 1000 }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (rectWhite.width == 300) {
                                rectWhite.x= width
                                rectWhite.width=301
                                //rectWhite.height=600
                                //rectWhite.rotation=90
                            }
                            else {
                                rectWhite.x= -width/2
                                rectWhite.width=300
                                //rectWhite.height=300
                                //rectWhite.rotation=45
                            }
                        }
                    }

                }


                Rectangle {
                    id: rectTogether
                    width: 450
                    height: 425
                    anchors.right: rectWhite.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Qt.lighter("lightgray")


                    Image {
                        anchors.centerIn: parent
                        source: "IMAGES/marca-oficial.png"
                        sourceSize: Qt.size(250, 300)
                        fillMode: Image.PreserveAspectFit
                    }

                }
            }

            Column {
                width: parent.width/2
                height: parent.height
                Text {
                    id: labelHour
                    text: p1.hours+":"+p1.minutes+":"+p1.seconds
                    color: Qt.lighter("lightgray")
                    width: parent.width
                    height: parent.height/2
                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignRight
                    font { family: robotoThin.name;      weight: Font.Thin;  pixelSize: 180; }
                }

                Text {
                    id: labelDate
                    text: Qt.formatDateTime(new Date(), "dd/MM/yyyy")
                    color: Qt.lighter("lightgray")
                    width: parent.width
                    height: parent.height/2
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignRight
                    font { family: robotoThin.name;      weight: Font.Light;  pixelSize: 80; }
                }
            }
        }

    }
}
