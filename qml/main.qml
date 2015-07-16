import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import GoogleAnalytics 0.1
import Qt.labs.settings 1.0
import "widget" as Widget

ApplicationWindow {
    id: app
    visible: true
    width: 480
    height: 720

    property bool portrait: width<height?true:false
    property bool landscape: height<width?true:false
    property int minSize: width<height?width:height

    FontLoader{ source: "qrc:/chunky.ttf" }
    FontLoader{ source: "qrc:/GosmickSans.ttf" }

    Component.onDestruction: tracker.endSession()

    GATracker {
        id: tracker
        logLevel: GATracker.Debug
        sendInterval: 20*1000
        viewportSize: qsTr("%1x%2").arg(app.width).arg(app.height)
        trackingID: "UA-64338289-1"
    }

    Settings {
        id: settings
        property bool sound: true
    }

    Audio {
        id: sound
        autoPlay: false
        source: "qrc:/music/button.wav"
        volume: settings.sound? 1.0: 0.0

        function myPlay()
        {
            if (playbackState == Audio.PlayingState)
                stop()
            play()
        }
    }

    Image {
        anchors.fill: parent
        source: bg_image()

        function bg_image() {
            if (parent.width > parent.height)
                return "qrc:/image/main_bg_landscape.png"
            else
                return "qrc:/image/main_bg_portrait.png"
        }
    }

//    BorderImage {
//        anchors.fill: parent
//        border { left: 202; top: 190; right: 325; bottom: 615 }
//        horizontalTileMode: BorderImage.Stretch
//        verticalTileMode: BorderImage.Stretch
//        source: "qrc:/image/main_bg.png"
//        asynchronous: true
//    }

    StackView {
        id: stackView
        anchors.fill: parent
        anchors.topMargin: 15 * dp
        initialItem: Qt.resolvedUrl("qrc:/HomePage.qml")

        focus: true
        Keys.onReleased: {
            if( event.key === Qt.Key_Back || event.key === Qt.Key_Escape )
            {
                if (stackView.depth > 1) {
                    sound.myPlay()
                    stackView.pop();
                    event.accepted = true;
                }
            }
        }
    }

    Widget.Button {
        enabled: stackView.depth>1
        opacity: enabled?1:0
        visible: enabled

        text: "back"

        Component.onCompleted: {
            anchorBottomLeft()
            setRed()
        }

        onClicked: {
            sound.myPlay()
            stackView.pop()
        }
    }
}
