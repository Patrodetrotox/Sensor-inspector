import QtQuick.Controls 2.0

ApplicationWindow {
    title: qsTr("Sensor Inspector")
    width: 360; height: 640
    visible: true
    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: "\u25C0"
            visible: pageStack.depth > 1
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: pageStack.pop()
        }
        Label {
            text: pageStack.currentItem.title
            anchors.centerIn: parent
        }
    }

    StackView {
        id: pageStack
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("pages/SensorListPage.qml")
    }
}
