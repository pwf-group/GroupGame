import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "widget" as Widget

Item {
    id: root

    Widget.BoundingBox {
        id: boundaryBox
    }

    Text {
        id: title
        anchors.top: boundaryBox.top
        anchors.topMargin: 24 * dp
        anchors.horizontalCenter: boundaryBox.horizontalCenter

        width: minSize < 480 * dp ? boundaryBox.width - 48 * dp : 432 * dp
        horizontalAlignment: Text.AlignHCenter

        font.pixelSize: 45 * dp
        fontSizeMode: Text.Fit
        font.family: "chunky"
        color: "#552700"

        text: "Setting"
    }

    Column {
        id: columnNext
        anchors.centerIn: boundaryBox
        spacing: 24 * dp

        CheckBox {
            text: qsTr("Sound")
            checked: settings.sound

            onClicked: settings.sound = checked

            style: CheckBoxStyle {
                indicator: Rectangle {
                        implicitWidth: 24 * dp
                        implicitHeight: 24 * dp
                        radius: 4 * dp
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1 * dp
                        Rectangle {
                            visible: control.checked
                            color: "#555"
                            border.color: "#333"
                            radius: 1 * dp
                            anchors.margins: 4 * dp
                            anchors.fill: parent
                        }
                }
                label: Widget.Text {
                    text: control.text
                    font.pixelSize: 24 * dp
                }
                spacing: 24 * dp
            }
        }
    }
}
