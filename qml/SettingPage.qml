import QtQuick 2.3
import "widget" as Widget

Item {
    id: root

    Widget.BoundingBox {
        id: boundaryBox
    }

    Text {
        id: title
        anchors.top: boundaryBox.top
        anchors.topMargin: 24 * dp
        anchors.horizontalCenter: boundaryBox.horizontalCenter

        width: minSize < 480 * dp ? boundaryBox.width - 48 * dp : 432 * dp
        horizontalAlignment: Text.AlignHCenter

        font.pixelSize: 45 * dp
        fontSizeMode: Text.Fit
        font.family: "chunky"
        color: "#552700"

        text: "Setting"
    }

    Column {
        id: columnNext
        anchors.centerIn: boundaryBox
        spacing: 24 * dp

        Widget.CheckBox {
            text: qsTr("Sound")
            checked: settings.sound
            onClicked: settings.sound = checked
        }

        Widget.CheckBox {
            text: qsTr("Rate us popup")
            checked: !settings.reviewOk
            onClicked: settings.reviewOk = !checked
        }
    }
}
