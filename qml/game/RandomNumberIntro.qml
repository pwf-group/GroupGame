import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("RandomNumberIntro")
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
            text: "Minimum Value: "
        }

        Widget.TextField {
            id: minimum
            width: 200 * dp
            maximumLength: 7
            inputMethodHints: Qt.ImhDigitsOnly
            text: settings.randomNumberMin
        }

        Widget.Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 28 * dp
            text: "Maximum Value: "
        }

        Widget.TextField {
            id: maximum
            width: 200 * dp
            maximumLength: 7
            inputMethodHints: Qt.ImhDigitsOnly
            text: settings.randomNumberMax
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
            settings.randomNumberMax = maximum.text
            settings.randomNumberMin = minimum.text
            stackView.push({
                item: Qt.resolvedUrl("qrc:/game/RandomNumberGame.qml"),
                properties: {minValue: minimum.text, maxValue: maximum.text}
            })
        }
    }
}
