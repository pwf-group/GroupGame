var component;
var sprite;

function createSpriteObjects() {
    component = Qt.createComponent("qrc:/widget/Cards.qml");
    if (component.status == Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation() {

    if (component.status == Component.Ready) {
        sprite = component.createObject(root, {"x": (root.width/2), "y": (root.height)});
        if (sprite == null)
            console.log("Error creating object");
        else
        {
            cardsList.push(sprite);

            var tempValue = (Math.floor(Math.random()*51)+1);
            while (showedCards.indexOf(tempValue) != -1 && showedCards.length < 51)
                tempValue = (Math.floor(Math.random()*51)+1);
            showedCards.push(tempValue);

            sprite.source = "qrc:/cards/cards/" + tempValue + ".png";
            sprite.y = (root.height/2) - (Math.random()*sprite.height);
            sprite.x = (root.width/2) - (Math.random()*sprite.width);
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
