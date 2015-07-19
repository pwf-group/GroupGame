import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

CheckBox {
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
        label: Text {
            text: control.text
            font.pixelSize: 24 * dp
        }
        spacing: 24 * dp
    }
}
