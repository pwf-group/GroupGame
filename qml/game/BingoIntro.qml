import QtQuick 2.3
import "../widget" as Widget

Item {
    id: root

    property variant itemsNumber: []
    property variant itemsCheck: []

    Widget.BoundingBox {
        id: boundingBox
    }

    Column {
        anchors.centerIn: parent
        width: boundingBox.width - 30 * dp
        spacing: 10 * dp

        Widget.Text {
            text: "Set your bingo sequence"
            width: parent.width
            wrapMode: Text.WordWrap
            font.bold: true
            font.pointSize: 20 * dp
        }

        Widget.BingoBox {
            id: bingoBox
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300 * dp
            items: initBingoModel()
        }

        Widget.Button {
            id: resetBtn
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: settings.bingoCheckSeq !== allUnchecked()
            visible: enabled
            text: "Reset"
            Component.onCompleted: setRed()

            onClicked: shuffleItemsNumber()

            function allUnchecked() {
                var a = []
                for (var i=0; i<25; i++)
                    a[i] = 0
                return a.join()
            }
        }

        Widget.Button {
            enabled: !resetBtn.visible
            visible: enabled
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Shuffle"
            onClicked: shuffleItemsNumber()
        }
    }

    Widget.Button {
        text: "next"

        Component.onCompleted: {
            anchorBottomRight()
            setGreen()
        }

        onClicked: {
            sound.myPlay()
            stackView.push(Qt.resolvedUrl("qrc:/game/BingoGame.qml"))
        }
    }

    function initBingoModel() {
        var a = []

        if (settings.bingoNumberSeq === "") {
            for (var i=0; i<25; i++)
                a[i] = {"num": 0, "chk": 0}
        }
        else {
            var aNum = []
            var aChk = []

            var joinNumber = settings.bingoNumberSeq
            var joinCheck = settings.bingoCheckSeq
            aNum = joinNumber.split(",")
            aChk = joinCheck.split(",")

            for (var j=0; j<25; j++)
                a[j] = {"num": aNum[j], "chk": aChk[j]}
        }

        return a
    }

    function shuffleItemsNumber() {
        var minNumber = 1
        var maxNumber = 100
        var numberSize = 25
        var usedValue = []

        var tempValue = (Math.floor(Math.random()*maxNumber)+minNumber);
        for (var i=0; i<numberSize; i++) {
            while (usedValue.indexOf(tempValue) != -1 && usedValue.length < numberSize)
                tempValue = (Math.floor(Math.random()*maxNumber)+minNumber);
            usedValue.push(tempValue);
        }

        for (var j=0; j<numberSize; j++) {
            itemsNumber[j] = usedValue[j]
            itemsCheck[j] = 0
            bingoBox.modelItem.itemAt(j).num = usedValue[j]
            bingoBox.modelItem.itemAt(j).chk = 0
        }

        var joinNumber = itemsNumber.join()
        var joinCheck = itemsCheck.join()
        settings.bingoNumberSeq = joinNumber
        settings.bingoCheckSeq = joinCheck
    }
}
