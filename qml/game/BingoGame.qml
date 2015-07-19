import QtQuick 2.3
import QtMultimedia 5.0
import "../widget" as Widget

Item {
    id: root

    Audio {
        id: sound
        autoPlay: false
        source: "qrc:/music/bubble-6.wav"
        volume: settings.sound? 1.0: 0.0

        function myPlay()
        {
            if (playbackState == Audio.PlayingState)
                stop()
            play()
        }
    }

    Widget.BingoBox {
        id: bingoBox
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: 10 * dp
        }
        width: minSize - 50 * dp
        items: initBingoModel()

        onClicked: {
            sound.myPlay()

            var checked = bingoBox.modelItem.itemAt(index).chk
            if (checked === "1")
                checked = 0
            else
                checked = 1

            bingoBox.modelItem.itemAt(index).chk = checked
            updateSettingCheck(index, checked)
        }

        function initBingoModel() {
            var a = []
            var aNum = []
            var aChk = []

            var joinNumber = settings.bingoNumberSeq
            var joinCheck = settings.bingoCheckSeq
            aNum = joinNumber.split(",")
            aChk = joinCheck.split(",")

            for (var j=0; j<25; j++)
                a[j] = {"num": aNum[j], "chk": aChk[j]}

            return a
        }

        function updateSettingCheck(index, value) {
            var aChk = []

            var joinCheck = settings.bingoCheckSeq
            aChk = joinCheck.split(",")

            aChk[index] = value
            settings.bingoCheckSeq = aChk.join()
        }
    }
}
