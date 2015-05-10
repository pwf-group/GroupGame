import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root
    property int players: 4

    GridView {
        id: grid
        anchors.fill: parent
        anchors.margins: 24 * dp
        boundsBehavior: Flickable.StopAtBounds
        model: players

        cellWidth: portrait? (width/2) : (width*2/(players+1))
        cellHeight: portrait? (height*2/(players+1)) : (height/2)

        property int winner: -1
        delegate: Item {
            width: grid.cellWidth
            height: grid.cellHeight
            Rectangle {
                anchors.fill: parent
                opacity: 0.5
                color: {
                    if (grid.winner == -1)
                        return "lightsteelblue"
                    else if (grid.winner == index)
                        return "green"
                    else
                        return "red"
                }

                Behavior on color { ColorAnimation{duration: 250} }
            }

            Widget.Text {
                anchors.centerIn: parent
                font.pixelSize: 35 * dp
                text: index
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (grid.winner == -1)
                        grid.winner = index
                }
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#44000000"
        enabled: grid.winner != -1
        visible: enabled

        MouseArea {
            anchors.fill: parent
        }

        Widget.Button {
            anchors.centerIn: parent
            text: "RESET"
            onClicked: {
                sound.play()
                grid.winner = -1
            }
        }
    }
}
