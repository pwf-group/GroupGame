import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "../widget" as Widget

Item {
    id: root

    Column {
        id: column
        anchors.centerIn: parent
        spacing: 20 * dp

        Rectangle {
            width: minSize - 60 * dp
            color: trueOrDare? "red" : "green"
            height: minSize/2 - 80 * dp
            opacity: 0.5
            radius: 30 * dp

            Widget.Text {
                anchors.centerIn: parent
                font.pixelSize: 50 * dp
                text: "TRUTH"
                color: "#FFFFFF"
            }
        }

        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "START"
            onClicked: {
                sound.play()

                timerDelay.stop()
                timerDelay.interval = Math.floor((Math.random()+0.5)*5555)
                console.log(timerDelay.interval)
                timerTicks.start()
                timerDelay.start()
            }
        }

        Rectangle {
            width: minSize - 60 * dp
            color: trueOrDare? "green":"red"
            height: minSize/2 - 80 * dp
            opacity: 0.5
            radius: 30 * dp

            Widget.Text {
                anchors.centerIn: parent
                font.pixelSize: 50 * dp
                text: "DARE"
                color: "#FFFFFF"
            }
        }
    }

    property bool trueOrDare: false
    Timer {
        id: timerTicks
        interval: 444
        repeat: true
        onTriggered: trueOrDare = !trueOrDare
    }

    Timer {
        id: timerDelay
        onTriggered: timerTicks.stop()
    }
}
