import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtMultimedia 5.0
import "../widget" as Widget
import "CardsCreation.js" as CardsCreation

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("CardDeckGame")
        }
    }

    property var cardsList: []
    property var showedCards: []

    function spawnCard() {
        CardsCreation.createSpriteObjects()
    }

    Audio {
        id: sound
        autoPlay: false
        source: "qrc:/music/shooter-action.wav"
    }

    Image {
        anchors.fill: parent
        anchors.margins: 20 * dp
        z: -1
        source: "qrc:/image/card_background.png"
        fillMode: Image.Tile
    }

    Column {
        z: 2
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 20 * dp
        }
        spacing: 3 * dp

        Widget.Button {
            id: spawnButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Spawn Card"
            enabled: count<52
            visible: enabled

            property int count: 0
            onClicked: {
                count++;

                sound.play();
                root.spawnCard();
            }
        }
        Widget.Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Reset"
            onClicked: {
                spawnButton.count = 0;

                showedCards = [];
                while(cardsList.length != 0)
                    cardsList.pop().destroy();
            }
        }
    }
}
