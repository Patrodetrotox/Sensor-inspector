import QtQuick 2.0
import QtQuick.Controls 2.0
import QtSensors 5.2

Page {
    property alias sensorIdentifier: lightSensor.identifier

    title: qsTr("Light Sensor")

    LightSensor {
        id: lightSensor
        active: true
    }
    // ToDo: insert text to display illuminance in lux
    Label {
        text: lightSensor.reading ?
                                    qsTr("%1 lux".arg(lightSensor.reading.illuminance)):
                                    qsTr("Unknown")
        anchors.centerIn: parent
    }
}
