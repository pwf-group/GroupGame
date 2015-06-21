import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root

    ListModel {
        id: descriptionModel

        ListElement { text: "Select any number of dice for the game." }
        ListElement { text: "And click next." }
    }

    Widget.BoundingBox {
        id: boundaryBox
    }

    ListView {
        id: listView
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: columnNext.top
            margins: 36 * dp
        }
        spacing: 4 * dp
        model: descriptionModel

        header: Widget.Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35 * dp
            text: "Dice"
        }

        delegate: Widget.Text {
            anchors {
                left: parent.left
                leftMargin: 12 * dp
            }
            width: parent.width - 24 * dp
            font.pixelSize: 20 * dp
            text: (model.index + 1) + ". " + model.text
        }
    }

    Column {
        id: columnNext
        anchors {
            bottom: boundaryBox.bottom
            bottomMargin: 24 * dp
            horizontalCenter: boundaryBox.horizontalCenter
        }
        spacing: 24 * dp

        Widget.Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 28 * dp
            text: "Number of dice: " + slider.value
        }

        Widget.Slider {
            id: slider
            minimumValue: 1
            maximumValue: 6
            value: 1
            stepSize: 1
        }

        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "NEXT"
            onClicked: {
                sound.play()
                stackView.push({
                    item: Qt.resolvedUrl("qrc:/game/DiceGame.qml"),
                    properties: {dice: slider.value}
                })
            }
        }
    }
}
