import QtQuick 2.3
import QtQuick.Controls 1.2

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("HomePage")
        }
    }

    Rectangle {
        anchors.fill: title
        anchors.margins: - 12 * dp
        radius: 12 * dp
        color: "#FFd1AA"
        border.width: 3 * dp
        border.color: "#804515"
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
        font.family: "chunky"
        color: "#552700"

        text: "GroupGame"
    }

    Flickable {
        z: -1
        anchors {
            top: title.bottom
            topMargin: 24 * dp
            bottom: parent.bottom
            bottomMargin: 50 * dp
            left: parent.left
            right: parent.right
        }

        boundsBehavior: Flickable.StopAtBounds
        contentWidth: parent.width
        contentHeight: itemHolder.height
        bottomMargin: 50 * dp

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
                    color: item_color()
                    border.width: 2 * dp
                    border.color: "#552700"
                    Behavior on color { ColorAnimation { duration: 500 } }

                    Text {
                        id: gameText
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        fontSizeMode: Text.Fit
                        font.pixelSize: 45 * dp
                        text: model.name
                        font.family: "chunky"
                        color: "#FFd1AA"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (model.name === "Exit")
                                Qt.quit()

                            sound.myPlay()
                            stackView.push(Qt.resolvedUrl(model.link))
                        }
                        onPressed: parent.color = "#AA6F39"
                        onReleased: parent.color = item_color()
                        onCanceled: parent.color = item_color()
                    }

                    function item_color() {
                        if (model.name === "Exit")
                            return "#802415"
                        else
                            return "#804515"
                    }
                }
            }
        }
    }

    ListModel {
        id: selectionModel

        ListElement { name: "Time Bomb"; link: "qrc:/game/TimeBoomGame.qml" }
        ListElement { name: "Dice"; link: "qrc:/game/DiceIntro.qml" }
        ListElement { name: "Bottle Luck"; link: "qrc:/game/BottleLuckGame.qml" }
        ListElement { name: "Card Deck"; link: "qrc:/game/CardDeckGame.qml" }
        ListElement { name: "Truth or Dare"; link: "qrc:/game/TruthOrDareGame.qml" }
        ListElement { name: "Buzzer Beater"; link: "qrc:/game/BuzzerBeaterIntro.qml" }
        ListElement { name: "Setting"; link: "qrc:/SettingPage.qml" }
        ListElement { name: "Exit"; link: "" }
    }
}
