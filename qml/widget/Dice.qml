import QtQuick 2.3

SpriteSequence {
    id: sprite_seq
    running: false
    //goalSprite: ""

    function test(name) {
        console.log(name)
        sprite_seq.goalSprite = name
        //sprite_seq.jumpTo(name)
    }

    readonly property int diceSize: 325

    Sprite {
        name: "1"
        source: "qrc:/image/dice_sprite.png"
        frameCount: 1
        frameRate: 15
        frameHeight: diceSize
        frameWidth: diceSize
        frameX: 0 * diceSize
        frameY: 0
        to: {
            "2": 1,
            "3": 1,
            "4": 1,
            "5": 1
        }
    }

    Sprite {
        name: "2"
        source: "qrc:/image/dice_sprite.png"
        frameCount: 1
        frameRate: 15
        frameHeight: diceSize
        frameWidth: diceSize
        frameX: 1 * diceSize
        frameY: 0
        to: {
            "1": 1,
            "3": 1,
            "4": 1,
            "6": 1
        }
    }

    Sprite {
        name: "3"
        source: "qrc:/image/dice_sprite.png"
        frameCount: 1
        frameRate: 15
        frameHeight: diceSize
        frameWidth: diceSize
        frameX: 2 * diceSize
        frameY: 0
        to: {
            "1": 1,
            "2": 1,
            "5": 1,
            "6": 1
        }
    }

    Sprite {
        name: "4"
        source: "qrc:/image/dice_sprite.png"
        frameCount: 1
        frameRate: 15
        frameHeight: diceSize
        frameWidth: diceSize
        frameX: 3 * diceSize
        frameY: 0
        to: {
            "1": 1,
            "2": 1,
            "5": 1,
            "6": 1
        }
    }

    Sprite {
        name: "5"
        source: "qrc:/image/dice_sprite.png"
        frameCount: 1
        frameRate: 15
        frameHeight: diceSize
        frameWidth: diceSize
        frameX: 4 * diceSize
        frameY: 0
        to: {
            "1": 1,
            "3": 1,
            "4": 1,
            "6": 1
        }
    }

    Sprite {
        name: "6"
        source: "qrc:/image/dice_sprite.png"
        frameCount: 1
        frameRate: 15
        frameHeight: diceSize
        frameWidth: diceSize
        frameX: 5 * diceSize
        frameY: 0
        to: {
            "2": 1,
            "3": 1,
            "4": 1,
            "5": 1
        }
    }
}
