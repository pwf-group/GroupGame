import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtMultimedia 5.0
import "../widget" as Widget

Item {
    id: root

    property int seconds: 0
    property int minutes: 0
    property bool started: false
    property bool bombed: false

    Timer {
        id: timer
        onTriggered: {
            bombed = true
            ticktock.stop()
            alarm.play()
        }

        function startTimer(minutes, seconds) {
            stop()
            interval = (minutes * 60 + seconds ) * 1000
            start()
        }
    }

    Image {
        id: bombBg
        anchors.fill: parent
        source: "qrc:/image/bomb_background.png"
        sourceSize.width: root.width
        sourceSize.height: root.height
    }

    Audio {
        id: alarm
        autoPlay: false
        source: "qrc:/music/alarm-clock.wav"
    }

    Audio {
        id: ticktock
        autoPlay: false
        loops: Audio.Infinite
        source: "qrc:/music/tick-tock.wav"
    }

    Column {
        anchors.centerIn: parent

        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            visible: !started
            text: "START"
            onClicked: {
                sound.play()
                ticktock.play()

                started = true
                alarm.stop()
                timer.startTimer(root.minutes, root.seconds)
            }
        }
        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            visible: bombed
            text: "RESET"
            onClicked: {
                sound.play()
                stackView.pop()
            }
        }
    }
}
