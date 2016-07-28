import QtQuick 2.3
import "widget" as Widget

Item {
    id: root

    Widget.BoundingBox {
        id: boundingBox
    }

    Flickable {
        anchors.fill: boundingBox
        anchors.margins: 20 * dp
        contentHeight: column.height
        contentWidth: width

        Column {
            id: column
            width: parent.contentWidth

            Widget.Text {
                font.pointSize: 30 * dp
                font.bold: true
                text: "About"
            }
        }
    }
}
