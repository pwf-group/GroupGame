import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("BottleLuckGame")
        }
    }

    Audio {
        id: sound
        autoPlay: false
        source: "qrc:/music/bottle-spin.wav"
        //loops: Audio.Infinite
        playbackRate: 1.27

        function myPlay()
        {
            if (playbackState == Audio.PlayingState)
                stop()
            play()
        }
    }

    property int counter: 1
    property int defaultSpinSpeed: 250
    property int animationDuration: defaultSpinSpeed
    property int animationFrom: 0
    property int animationTo  : 360

    Image {
        anchors.fill: parent
        anchors.margins: 15 * dp
        source: "qrc:/image/bottle_table.jpg"
    }

    Image {
        id: bottle
        anchors.centerIn: parent
        height: minSize * 0.8
        fillMode: Image.PreserveAspectFit
        source: "qrc:/image/bottle.png"

        RotationAnimation on rotation {
            id: bottleAnimation
            loops: Animation.Infinite
            from: animationFrom
            to: animationTo
            duration: animationDuration
            running: false
        }
    }

    Timer {
        id: velocityTimer
        interval: 888
        repeat: true
        onTriggered: {
            bottleAnimation.stop()

            var curRotation = Math.floor(bottle.rotation % 360)
            animationFrom = curRotation
            animationTo = curRotation + 360

            counter = counter * 2
            animationDuration =  counter * defaultSpinSpeed

            bottleAnimation.restart()
        }
    }

    Timer {
        id: stopTimer
        interval: 8888
        repeat: false
        onTriggered: {
            velocityTimer.stop()
            stopTimer.stop()
            bottleAnimation.stop()
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            // reset all parameters
            counter = 1
            animationDuration = defaultSpinSpeed
            velocityTimer.stop()
            stopTimer.stop()
            bottleAnimation.restart()
            sound.stop()
        }
        onReleased: {
            // start sequence of auto stop
            velocityTimer.start()
            stopTimer.start()
            sound.myPlay()
        }
    }
}
