import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Sensor.Inspector 1.0
import "../assets"

Page {
    property alias sensorIdentifier: accelerometer.identifier

    title: qsTr("No Gravity Accelerometer")

    NoGravityAccelerometer {
        id: accelerometer

        active: true

        onReadingChanged: {
            if (reading) {
                xDisplay.value = accelerometer.reading.x.toFixed(6);
                yDisplay.value = accelerometer.reading.y.toFixed(6);
                zDisplay.value = accelerometer.reading.z.toFixed(6);
            } else {
                xDisplay.value = "";
                yDisplay.value = "";
                zDisplay.value = "";
            }
        }
    }
    Pane {
        anchors.fill: parent

        ColumnLayout {
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            ValueDelegate {
                id: xDisplay

                label: qsTr("x")
                valid: accelerometer.reading
                notValidText: qsTr("No accelerometer data")
                Layout.fillWidth: true
            }
            ValueDelegate {
                id: yDisplay
                label: qsTr("y")
                valid: accelerometer.reading
                notValidText: qsTr("No accelerometer data")
                Layout.fillWidth: true
            }
            ValueDelegate {
                id: zDisplay

                label: qsTr("z")
                valid: accelerometer.reading
                notValidText: qsTr("No accelerometer data")
                Layout.fillWidth: true
            }
        }
    }
}
