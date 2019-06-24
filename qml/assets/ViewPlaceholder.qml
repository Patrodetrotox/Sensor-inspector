import QtQuick 2.0
import QtQuick.Controls 2.0

Label {
    visible: enabled
    anchors.fill: parent
    font.pixelSize: Qt.application.font.pixelSize * 2
    color: palette.toolTipText
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    background: Rectangle { color: palette.toolTipBase }
}
