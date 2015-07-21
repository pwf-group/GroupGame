import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("DiceIntro")
        }
    }

    Widget.BoundingBox {
        id: boundaryBox
    }

    Column {
        id: columnNext
        anchors.centerIn: boundaryBox
        spacing: 24 * dp

        Widget.Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 28 * dp
            text: "Number of dice: " + slider.value
        }

        Widget.Slider {
            id: slider
            width: parent.width
            minimumValue: 1
            maximumValue: 6
            value: 1
            stepSize: 1
        }
    }

    Widget.Button {
        text: "next"

        Component.onCompleted: {
            anchorBottomRight()
            setGreen()
        }

        onClicked: {
            sound.myPlay()
            stackView.push({
                item: Qt.resolvedUrl("qrc:/game/DiceGame.qml"),
                properties: {dice: slider.value}
            })
        }
    }
}
