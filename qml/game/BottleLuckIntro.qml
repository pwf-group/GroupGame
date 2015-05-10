import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root

    ListModel {
        id: descriptionModel

        ListElement { text: "Get a group of friend to sit in a circle." }
        ListElement { text: "Put the device in the center of the circle." }
        ListElement { text: "Tap anywhere on the screen to spin the bottle." }
        ListElement { text: "Wait for the bottle to stop spinning." }
        ListElement { text: "The loser is decided when the bottle stop." }
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
            bottom: btnNext.top
            margins: 36 * dp
        }
        spacing: 4 * dp
        model: descriptionModel

        header: Widget.Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35 * dp
            text: "Bottle Luck"
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

    Widget.Button {
        id: btnNext
        anchors {
            bottom: boundaryBox.bottom
            bottomMargin: 24 * dp
            horizontalCenter: boundaryBox.horizontalCenter
        }
        text: "NEXT"
        onClicked: {
            sound.play()
            stackView.push(Qt.resolvedUrl("qrc:/game/BottleLuckGame.qml"))
        }
    }
}

