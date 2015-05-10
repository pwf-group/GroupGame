import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Button {
    id: root

    style: ButtonStyle {
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 25
            border.width: 2 * dp
            border.color: "gray"
            radius: 6 * dp
            color: control.pressed ? "lightgray" : "white"
        }
        label: Text {
            font.pixelSize: 35 * dp
            font.family: "Montague"
            color: "gray"
            horizontalAlignment: Text.AlignHCenter
            text: root.text
        }
    }
}
