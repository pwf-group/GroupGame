import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("BuzzerBeaterIntro")
        }
    }

    ListModel {
        id: descriptionModel

        ListElement { text: "Fight to see who press the buzzer first." }
        ListElement { text: "Get a host to ask any question to the audience." }
        ListElement { text: "The audience have to press quickly to answer." }
        ListElement { text: "Only the quickest buzzer will light up" }
        ListElement { text: "Click on the reset to restart the play." }
        ListElement { text: "Spice up the game by giving punishment to the loser." }
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
            text: "Buzzer"
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
            text: "Players: " + slider.value
        }

        Widget.Slider {
            id: slider
            minimumValue: 2
            maximumValue: 10
            value: 4
            stepSize: 1
        }

        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "NEXT"
            onClicked: {
                sound.myPlay()
                stackView.push({
                    item: Qt.resolvedUrl("qrc:/game/BuzzerBeaterGame.qml"),
                    properties: {players: slider.value}
                })
            }
        }
    }
}
