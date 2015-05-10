import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Slider {
    id: slider
    width: 300 * dp

    style: SliderStyle {
        groove: Rectangle {
            implicitWidth: 200
            implicitHeight: 8
            color: "gray"
            radius: 8
        }
        handle: Rectangle {
            anchors.centerIn: parent
            color: control.pressed ? "lightgray" : "white"
            border.color: "gray"
            border.width: 2 * dp
            implicitWidth: 34 * dp
            implicitHeight: 34 * dp
            radius: 12 * dp
        }
    }
}
