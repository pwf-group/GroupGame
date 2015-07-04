import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("TimeBombIntro")
        }
    }

    ListModel {
        id: descriptionModel

        ListElement { text: "Get a group of friend to sit in a circle." }
        ListElement { text: "Start by setting a the time it take to detonate." }
        ListElement { text: "Game play goes by asking a question the person sitting beside you." }
        ListElement { text: "And then pass the bomb to the next person." }
        ListElement { text: "The person holding the boom has to answer the question." }
        ListElement { text: "And then ask a question for the next person before passing the bomb." }
        ListElement { text: "Repeat this until the boom detonate." }
        ListElement { text: "The person holding the bomb is the loser." }
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
            text: "Time Bomb"
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
            sound.myPlay()
            stackView.push(Qt.resolvedUrl("qrc:/game/TimeBoomGame.qml"))
        }
    }
}
