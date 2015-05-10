import QtQuick 2.3

Item {
    id: root

    Rectangle {
        anchors.fill: title
        anchors.margins: - 12 * dp
        radius: 12 * dp
        color: "#FFFFFF"
        border.width: 3 * dp
        border.color: "#000000"
    }

    Text {
        id: title
        anchors.top: parent.top
        anchors.topMargin: 45 * dp
        anchors.horizontalCenter: parent.horizontalCenter
        width: minSize < 480 * dp ? parent.width - 48 * dp : 432 * dp
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 65 * dp
        fontSizeMode: Text.Fit
        font.family: "Montague"
        //font.family: "Karmatic Arcade"
        color: "#000000"
        text: "Ice Breaker"
    }

    Flickable {
        z: -1
        anchors {
            top: title.bottom
            topMargin: 24 * dp
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        boundsBehavior: Flickable.StopAtBounds
        contentWidth: parent.width
        contentHeight: itemHolder.height

        Column {
            id: itemHolder
            width: title.width + 24 * dp
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12 * dp

            Repeater {
                model: selectionModel
                delegate: Rectangle {
                    width: parent.width
                    height: gameText.contentHeight + 30 * dp
                    color: "#ccf4a460"
                    border.width: 1 * dp
                    border.color: "#55000000"

                    Text {
                        id: gameText
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        fontSizeMode: Text.Fit
                        font.pixelSize: 45 * dp
                        text: model.name
                        font.family: "Montague"
                        color: "#FFFFFF"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (model.name === "Exit")
                                Qt.quit()

                            sound.play()
                            stackView.push(Qt.resolvedUrl(model.link))
                        }
                    }
                }
            }
        }
    }

    ListModel {
        id: selectionModel

        ListElement { name: "Time Bomb"; link: "qrc:/game/TimeBoomIntro.qml" }
        ListElement { name: "Bottle Luck"; link: "qrc:/game/BottleLuckIntro.qml" }
        ListElement { name: "Truth or Dare"; link: "qrc:/game/TruthOrDareIntro.qml" }
        ListElement { name: "Buzzer Beater"; link: "qrc:/game/BuzzerBeaterIntro.qml" }
        ListElement { name: "Exit"; link: "" }
    }
}
