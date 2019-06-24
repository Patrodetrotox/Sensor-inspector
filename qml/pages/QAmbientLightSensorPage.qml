import QtQuick 2.0
import QtQuick.Controls 2.0
import QtSensors 5.2
import QtQuick.Layouts 1.0

Page {
    id: page

    property alias sensorIdentifier: ambientLightSensor.identifier

    title: qsTr("Ambient Light Sensor")

    AmbientLightSensor {
        id: ambientLightSensor
        active: true
    }
    Pane {
        id: pane

        anchors.fill: parent

        ColumnLayout {
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            spacing: pane.padding

            Repeater {
                model: [
                    { name: qsTr("Sunny"),    lightLevel: AmbientLightReading.Sunny    },
                    { name: qsTr("Bright"),   lightLevel: AmbientLightReading.Bright   },
                    { name: qsTr("Light"),    lightLevel: AmbientLightReading.Light    },
                    { name: qsTr("Twilight"), lightLevel: AmbientLightReading.Twilight },
                    { name: qsTr("Dark"),     lightLevel: AmbientLightReading.Dark     }
                ]
                delegate: Label {
                    text: modelData.name
                    // ToDo: enable when the current light level is greater or equal
                    enabled: ambientLightSensor.reading && ambientLightSensor.reading.lightLevel >= modelData.lightLevel
                    color: enabled ? palette.highlightedText : palette.text
                    horizontalAlignment: Label.AlignHCenter
                    verticalAlignment: Label.AlignVCenter
                    Layout.preferredHeight: Qt.application.font.pixelSize * 3
                    Layout.fillWidth: true
                    background: Rectangle { color: enabled ? palette.highlight : palette.window }
                }
            }
        }
    }
}
