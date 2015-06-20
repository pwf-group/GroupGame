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
            cardsList.push(sprite)
            sprite.source = "qrc:/cards/cards/" + (Math.floor(Math.random()*52)+1) + ".png"
            sprite.y = (root.height/2 - (sprite.height-10*dp)) + Math.random()*sprite.height*dp;
            sprite.x = (root.width/2 - (sprite.width-10*dp)) + Math.random()*sprite.width*dp;
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
