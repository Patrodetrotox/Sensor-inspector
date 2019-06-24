import QtQuick 2.6
import QtQuick.Controls 2.2
import QtSensors 5.2
import "../assets"

Page {
    property var knownSensors: {
        "QAccelerometer": true,
        "QAmbientLightSensor": true,
        "QLightSensor": true,
        "QOrientationSensor": true,
        "QProximitySensor": true,
        "QRotationSensor": true,
        "NoGravityAccelerometer": true
    }

    title: qsTr("Device Sensors")

    Pane {
        anchors.fill: parent

        ListView {
            anchors.fill: parent
            model:  ListModel { id: sensorModel }
            delegate: sensorDelegate

            // ToDo: make sectios by sensor type
            section {
                property: "type"
                delegate: SectionDelegate { }
            }

            Component.onCompleted: {
                QmlSensors.sensorTypes().forEach(function (sensorType) {
                    var defaultSensor = QmlSensors.defaultSensorForType(sensorType);
                    QmlSensors.sensorsForType(sensorType).forEach(function(sensor) {
                        sensorModel.append({
                                               sensorIdentifier: sensor,
                                               type: sensorType,
                                               isDfault: sensor === defaultSensor
                                           });
                    });
                    // ToDo: fill model with sensors descriptions
                });
                sensorModel.append({
                                       sensorIdentifier: QmlSensors.defaultSensorForType("QAccelerometer"),
                                       type: "NoGravityAccelerometer",
                                       isDefault: false
                                   });
                // ToDo: append NoGravityAccelerometerPage
            }
        }
        ViewPlaceholder {
            enabled: sensorModel.count === 0
            text: qsTr("No sensors")
        }
    }
    Component {
        id: sensorDelegate

        ItemDelegate {
            text: model.sensorIdentifier
            // ToDo: use sensor identifier as text
            enabled: knownSensors[model.type] === true
            // ToDo: highlight default sensor with bold font
            font.bold: model.isDefault
            width: parent.width
            // ToDo: push the correpsonding page to the stack on click
            onClicked: pageStack.push("./%1Page.qml".arg(model.type),
                                      { sensorIdentifier: model.sensorIdentifier});
        }
    }
}
