import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ColumnLayout {
    property alias label: label.text
    property var value
    property bool valid: value
    property alias notValidText: textField.placeholderText

    Label {
        id: label

        visible: valid
        Layout.fillWidth: true
    }
    TextField {
        id: textField

        text: valid ? "%1".arg(value) : ""
        readOnly: true
        Layout.fillWidth: true
    }
}
