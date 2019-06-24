import QtQuick 2.0
import QtQuick.Controls 2.0
import QtSensors 5.2

Page {
    property alias sensorIdentifier: rotationSensor.identifier

    title: qsTr("Rotation Sensor")

    RotationSensor {
        id: rotationSensor
        active: true
        axesOrientationMode: Sensor.AutomaticOrientation
    }
    Image {
        id: image
        source: "../graphics/logo_qt_2016.png"
        anchors.centerIn: parent
        width: parent.width / 2
        height: parent.height / 2
        fillMode: Image.PreserveAspectFit
        // ToDo: transform the image to make it always be horizontal
        transform: [
            Rotation {
                origin {x: image.width / 2; y: image.height / 2}
                axis { x: 1; y: 0; z: 0 }
                angle: rotationSensor.reading ?
                           rotationSensor.reading.x:
                           0
            },
            Rotation {
                origin {x: image.width / 2; y: image.height / 2}
                axis { x: 0; y: 1; z: 0}
                angle: rotationSensor.reading ?
                           rotationSensor.reading.y:
                           0
            }
        ]
    }
}
