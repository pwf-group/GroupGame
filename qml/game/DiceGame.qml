import QtQuick 2.3
import QtQuick.Controls 1.2
import "../widget" as Widget

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("DiceGame")
        }
    }

    property int dice: 1
    property bool roll: false

    Image {
        anchors.fill: parent
        anchors.margins: 24 * dp
        z: -1
        source: "qrc:/image/card_background.png"
        fillMode: Image.Tile
    }

    Column {
        id: column
        anchors.centerIn: parent
        width: 220 * dp
        spacing: 20 * dp

        Repeater {
            id: colRepeater
            model: (dice)/2

            Row {
                id: row
                anchors.horizontalCenter: column.horizontalCenter
                spacing: 20 * dp

                Repeater {
                    id: rowRepeater
                    model: {
                        if ((index == colRepeater.count-1) && (dice % 2))
                            return 1
                        else
                            return 2
                    }

                    Widget.Dice {
                        width: 100 * dp
                        height: 100 * dp
                        running: roll
                    }
                }
            }
        }
    }

    Timer {
        id: stopTimer
        interval: 2000
        repeat: false
        onTriggered: {
            roll = false
        }
    }

    MouseArea {
        anchors.fill: parent
        anchors.margins: 24 * dp
        onPressed: {
            roll = true
            stopTimer.stop()
        }
        onReleased: {
            stopTimer.start()
        }
    }
}
