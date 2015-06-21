import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0

ApplicationWindow {
    visible: true
    width: 480
    height: 720

    property bool portrait: width<height?true:false
    property bool landscape: height<width?true:false
    property int minSize: width<height?width:height

    FontLoader{ source: "qrc:/ka1.ttf"}
    FontLoader{ source: "qrc:/Montague.ttf"}

    Audio {
        id: sound
        autoPlay: false
        source: "qrc:/music/catch.wav"
    }

    Image {
        anchors.fill: parent
        source: "qrc:/image/main_bg.jpg"
        fillMode: Image.Tile
        sourceSize.width: parent.width
        sourceSize.height: parent.height
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("qrc:/HomePage.qml")

        focus: true
        Keys.onReleased: {
            if( event.key === Qt.Key_Back || event.key === Qt.Key_Escape )
            {
                if (stackView.depth > 1) {
                    sound.play()
                    stackView.pop();
                    event.accepted = true;
                }
            }
        }
    }

    statusBar: Rectangle {
        enabled: stackView.depth>1
        opacity: enabled?1:0
        visible: enabled
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 56 * dp
        color: "#f4a460"

        Behavior on opacity { NumberAnimation{duration:500} }

        Text {
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 24 * dp
            }
            text: "<"
            font.pixelSize: 40 * dp
            color: "#FFFFFF"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    sound.play()
                    stackView.pop()
                }
            }
        }
    }
}
