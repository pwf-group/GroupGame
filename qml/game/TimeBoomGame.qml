import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("TimeBombGame")
        }
    }

    Column {
        id: column
        anchors.centerIn: parent
        spacing: 20 * dp

        Widget.TimePickerCustom {
            id: timePicker
            width: minSize < 330 * dp? minSize - 30 * dp : 300 * dp
            height: width

            backgroundImage: "qrc:/image/overall look.png"
            hourDotImage: "qrc:/image/minutes_display.png"
            minutesDotImage: "qrc:/image/seconds_display.png"
        }

        Widget.Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 50 * dp
            text: timePicker.minutes + " : " + timePicker.seconds
        }

        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "help"

            onClicked: {
                sound.myPlay()
                stackView.push("qrc:/game/TimeBoomIntro.qml")
            }
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
                item: Qt.resolvedUrl("qrc:/game/TimeBombGame2.qml"),
                properties: {seconds: timePicker.seconds, minutes: timePicker.minutes}
            })
        }
    }
}
