import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

TextField {
   height: 38 * dp
   font.pixelSize: 35 * dp
   font.family: "GosmickSans"
   horizontalAlignment: TextInput.AlignHCenter

   style: TextFieldStyle {
       textColor: "black"
       background: Item {
            implicitWidth: control.width + 20 * dp
            implicitHeight: control.height + 20 * dp

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 2 * dp
                color: "#333"
            }
       }
   }
}
