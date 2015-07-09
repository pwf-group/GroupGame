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
        volume: settings.sound? 1.0: 0.0

        function myPlay()
        {
            if (playbackState == Audio.PlayingState)
                stop()
            play()
        }
    }

    Image {
        id: background
        anchors.fill: parent
        anchors.margins: 24 * dp
        z: -1
        source: "qrc:/image/card_background.png"
        fillMode: Image.Tile
    }

    MouseArea {
        id: spawnButton
        anchors.fill: background

        enabled: count<52

        property int count: 0
        onClicked: {
            count++;

            sound.myPlay();
            root.spawnCard();
        }
    }

    Widget.Button {
        z: 3
        text: "reset"

        Component.onCompleted: {
            anchorBottomRight()
            setGreen()
        }

        onClicked: {
            spawnButton.count = 0;

            showedCards = [];
            while(cardsList.length != 0)
                cardsList.pop().destroy();
        }
    }
}
