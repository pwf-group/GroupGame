import QtQuick 2.3
import "widget" as Widget

Rectangle {
    id: root
    anchors.fill: parent
    color: "#55000000"

    enabled: false
    visible: false

    property int point: 0

    MouseArea {
        anchors.fill: parent
        onClicked: root.hide()
    }

    Rectangle {
        anchors.centerIn: parent
        width: colHolder.width + 50 * dp
        height: colHolder.height + 50 * dp
        radius: 10 * dp

        border.width: 2 * dp
        border.color: "#A3A6BD"

        Column {
            id: colHolder
            anchors.centerIn: parent
            spacing: 20 * dp

            Text {
                id: title
                anchors.horizontalCenter: parent.horizontalCenter
                width: minSize < 480 * dp ? parent.width - 10 * dp : 432 * dp
                horizontalAlignment: Text.AlignHCenter

                font.pointSize: 22
                fontSizeMode: Text.Fit
                font.bold: true

                font.family: "GosmickSans"
                text: "Thanks for using GroupGame!"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                width: title.width
                wrapMode: Text.WordWrap
                font.pointSize: 16
                font.family: "GosmickSans"
                text: "Would you like to help us rate on Playstore?"
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10 * dp

                Widget.Button {
                    text: "Not now"
                    Component.onCompleted: setRed()
                    onClicked: root.hide()
                }

                Widget.Button {
                    text: "Okay!"
                    Component.onCompleted: setGreen()
                    onClicked: {
                        settings.reviewOk = true
                        tracker.sendEvent("review", "okay")
                        Qt.openUrlExternally("https://play.google.com/store/apps/details?id=org.pwf.groupgame")
                        root.hide()
                    }
                }
            }
        }
    }

    function show() {
        if(platformOS !== "android")
            return

        tracker.sendEvent("review", "show")
        root.enabled = true
        root.visible = true
    }

    function hide() {
        root.enabled = false
        root.visible = false
    }
}

