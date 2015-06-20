import QtQuick 2.3

Image {
    width: 150 * dp
    fillMode: Image.PreserveAspectFit

    source: "qrc:/cards/cards/0.png"

    Behavior on y { SmoothedAnimation{velocity: 1000} }

    SmoothedAnimation on rotation {
        from: Math.random()*360
        to: Math.random()*360 + 360
        velocity: 1000
    }
}

