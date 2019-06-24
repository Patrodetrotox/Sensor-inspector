import QtQuick 2.0
import QtQuick.Controls 2.0
import QtSensors 5.2
import "../assets"

Page {
    id: page

    property alias sensorIdentifier: orientationSensor.identifier

    title: qsTr("Orientation Sensor")

    OrientationSensor {
        id: orientationSensor
        active: true
    }
    // ToDo: insert a ball which acceleration direction is controlled by orientation
    Ball {
        center: Qt.point(parent.width / 2, parent.height / 2)
        color: palette.highlight
        radius: Math.min(parent.width, parent.height) / 8
        acceleration: {
            if(!orientationSensor.reading) {
                return Qt.vector24(0, 0);
            }
            switch( orientationSensor.reading.orientation) {
               case OrientationReading.TopUp:
                    return Qt.vector2d(0, 5000);
                   case OrientationReading.TopDown:
                       return Qt.vector2d(0, -5000);
                   case OrientationReading.LeftUp:
                       return Qt.vector2d(5000, 0);
                   case OrientationReading.RightUp:
                       return Qt.vector2d(-5000, 0);
                   case OrientationReading.FaceUp:

                   case OrientationReading.FaceDown:
            }


        }

    }
}
