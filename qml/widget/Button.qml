import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Button {
    id: root
    property color backgroundColor: "white"
    property color pressedColor: "lightgray"
    property color textColor: "gray"

    function setRed() {
        backgroundColor = "#802415"
        pressedColor = "#F4A460"
        textColor = "#FFd1AA"
    }

    function setGreen() {
        backgroundColor = "#64B058"
        pressedColor = "#1E6912"
        textColor = "#0A4600"
    }

    function anchorBottomLeft() {
        anchors.bottom = parent.bottom
        anchors.left = parent.left
        anchors.bottomMargin = 24 * dp
        anchors.leftMargin = 24 * dp
    }

    function anchorBottomRight() {
        anchors.bottom = parent.bottom
        anchors.right = parent.right
        anchors.bottomMargin = 24 * dp
        anchors.rightMargin = 24 * dp
    }

    style: ButtonStyle {
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 25
            border.width: 3 * dp
            border.color: textColor
            radius: 6 * dp
            color: control.pressed ? pressedColor : backgroundColor

            Behavior on color { ColorAnimation {duration: 300} }
        }
        label: Text {
            font.pixelSize: 35 * dp
            font.family: "GosmickSans"
            font.bold: true
            color: textColor
            horizontalAlignment: Text.AlignHCenter
            text: root.text
        }
    }
}
