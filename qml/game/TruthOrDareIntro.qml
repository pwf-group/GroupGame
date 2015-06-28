import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "../widget" as Widget

Item {
    id: root

    Stack.onStatusChanged: {
        // change so that loading don't feel hang
        if(Stack.status == Stack.Active) {
            tracker.sendAppView("TruthOrDareIntro")
        }
    }

    ListModel {
        id: descriptionModel
    }

    Widget.BoundingBox {
        id: boundaryBox
    }

    ListView {
        id: listView
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: btnNext.top
            margins: 36 * dp
        }
        spacing: 4 * dp
        model: descriptionModel

        header: Widget.Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35 * dp
            text: "Truth or Dare"
        }

        delegate: Widget.Text {
            anchors {
                left: parent.left
                leftMargin: 12 * dp
            }
            width: parent.width - 24 * dp
            font.pixelSize: 20 * dp
            text: (model.index + 1) + ". " + model.text
        }
    }

    Widget.Button {
        id: btnNext
        anchors {
            bottom: boundaryBox.bottom
            bottomMargin: 24 * dp
            horizontalCenter: boundaryBox.horizontalCenter
        }
        text: "NEXT"
        onClicked: {
            sound.play()
            stackView.push(Qt.resolvedUrl("qrc:/game/TruthOrDareGame.qml"))
        }
    }
}
