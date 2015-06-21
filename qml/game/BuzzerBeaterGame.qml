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
        property int minSize: cellWidth<cellHeight ? cellWidth:cellHeight

        delegate: Item {
            width: grid.cellWidth
            height: grid.cellHeight

            Image {
                width: grid.minSize - 16 * dp
                height: grid.minSize - 16 * dp
                anchors.centerIn: parent

                source: {
                    if (grid.winner == -1)
                        return "qrc:/image/buzzer_default.png"
                    else if (grid.winner == index)
                        return "qrc:/image/buzzer_green.png"
                    else
                        return "qrc:/image/buzzer_red.png"
                }
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
