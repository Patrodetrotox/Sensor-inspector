import QtQuick 2.0
import QtQuick.Controls 2.0
import QtSensors 5.2
import "../assets"

Page {
    property alias sensorIdentifier: accelerometer.identifier

    title: qsTr("Accelerometer")

    Accelerometer {
        id: accelerometer
        active: true
    }
    // ToDo: insert a ball which acceleration is controlled by accelerometer

    Ball {
        center: Qt.point(parent.width / 2, parent.height / 2)
        color: palette.highlight
        radius: Math.min(parent.width, parent.height) / 8
        acceleration: accelerometer.reading ?
                      Qt.vector2d(-accelerometer.reading.x*1000, accelerometer.reading.y*1000):
                      Qt.vector2d(0, 0)
    }
}
