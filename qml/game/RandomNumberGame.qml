import QtQuick 2.3
import "../widget" as Widget

Item {
    id: root
    property string minValue: "1"
    property string maxValue: "10"
    property bool   roll: false

    Widget.BoundingBox {
        id: boundingBox
    }

    Widget.Text {
        id: number
        anchors.centerIn: boundingBox
        text: "0"
        width: minSize < 480 * dp ? parent.width - 48 * dp : 432 * dp
        height: font.pixelSize

        font.pixelSize: minSize - 100 * dp
        fontSizeMode: Text.Fit
    }

    Timer {
        id: numberTimer
        interval: 150
        repeat: true
        running: roll
        onTriggered: {
            number.text = getRandomNumber()
        }
    }

    Timer {
        id: stopTimer
        interval: 3000
        repeat: false
        onTriggered: {
            roll = false
        }
    }

    MouseArea {
        anchors.fill: boundingBox
        onPressed: {
            roll = true
            stopTimer.stop()
        }
        onReleased: {
            stopTimer.start()
        }
    }

    function getRandomNumber() {
        var min = parseInt(root.minValue)
        var max = parseInt(root.maxValue)

        return (Math.floor(Math.random()*max)+min);
    }
}

