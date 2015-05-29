import QtQuick 2.3
import "../widget" as Widget

Item {
    id: root
    property int dice: 1
    property bool roll: false

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

    Widget.Button {
        anchors.horizontalCenter: column.horizontalCenter
        anchors.top: column.bottom
        anchors.topMargin: 40 * dp

        text: !roll? "ROLL":"STOP"
        onClicked: {
            roll = !roll
        }
    }
}
