import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root

    Column {
        anchors.centerIn: parent
        spacing: 20 * dp

        Widget.TimePickerCustom {
            id: timePicker
            width: minSize < 330 * dp? minSize - 30 * dp : 300 * dp
            height: width

            function orientationSuffix() {
                if (root.width<root.height)
                    return "portrait.png"
                else
                    return "landscape.png"
            }

            backgroundImage: "qrc:/image/meegotouch-timepicker-light-1-" + orientationSuffix()
            hourDotImage: "qrc:/image/meegotouch-timepicker-disc-hours-" + orientationSuffix()
            minutesDotImage: "qrc:/image/meegotouch-timepicker-disc-minutes-" + orientationSuffix()
        }

        Widget.Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 50 * dp
            text: timePicker.minutes + " : " + timePicker.seconds
        }

        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "NEXT"
            onClicked: {
                sound.play()
                stackView.push({
                    item: Qt.resolvedUrl("qrc:/game/TimeBombGame2.qml"),
                    properties: {seconds: timePicker.seconds, minutes: timePicker.minutes}
                })
            }
        }
    }
}
