import QtQuick 2.3
import "../widget" as Widget

Item {
    id: root
    property int dice: 1

    Widget.Text {
        anchors.bottom: sprite.top
        anchors.horizontalCenter: sprite.horizontalCenter
        anchors.bottomMargin: 15 * dp
        text: sprite.currentSprite
        font.pixelSize: 30 * dp
    }

    SpriteSequence {
        id: sprite
        anchors.centerIn: parent
        width: 50 * dp
        height: 50 * dp
        running: false
        goalSprite: ""

        Sprite {
            name: "dice"
            source: "qrc:/image/dice_sprite.png"
            frameCount: 144
            frameHeight: 46
            frameWidth: 46
        }
    }
}
