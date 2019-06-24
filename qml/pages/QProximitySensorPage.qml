import QtQuick 2.0
import QtQuick.Controls 2.0
import QtSensors 5.2

Page {
    property alias sensorIdentifier: proximitySensor.identifier

    title: qsTr("Proximity Sensor")

    ProximitySensor {
        id: proximitySensor
        active: true
    }
    // ToDo: insert switch to monitor sensor state
    Switch {
        anchors.centerIn: parent
        checkable: false
        checked: proximitySensor.reading && proximitySensor.reading.near
    }
}
