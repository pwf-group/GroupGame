import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "../widget" as Widget
import "CardsCreation.js" as CardsCreation

Item {
    id: root

    property var cardsList: []

    Column {
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 20 * dp
        }
        spacing: 3 * dp

        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Spawn Card"
            onClicked: CardsCreation.createSpriteObjects()
        }
        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Reset"
            onClicked: {
                while(cardsList.length != 0)
                    cardsList.pop().destroy()
            }
        }

    }
}
