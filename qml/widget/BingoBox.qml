import QtQuick 2.3

Flow {
    id: root
    spacing: 10 * dp
    property variant items: []
    property int tableSize: 5
    property int boxSize: (width - (tableSize+1) * 10 * dp)/tableSize
    property alias modelItem: repeater

    signal clicked(var index)

    Repeater {
        id: repeater
        model: items

        Rectangle {
            property variant num: modelData.num
            property variant chk: modelData.chk

            width: boxSize
            height: boxSize
            radius: 5 * dp
            color: (chk==="1")?"green":"white"

            border.width: 2 * dp
            border.color: "#333"

            Behavior on color {ColorAnimation{duration: 500}}

            Text {
                anchors.centerIn: parent
                font.pixelSize: boxSize * 2/3
                text: parent.num
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.clicked(index)
                }
            }
        }
    }
}
