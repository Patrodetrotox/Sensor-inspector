#include "NoGravityAccelerometerFilter.h"
#include <QtMath>

#define GRAVITY 9.81

NoGravityAccelerometerFilter::NoGravityAccelerometerFilter() : QAccelerometerFilter()
{
    this->_rotationSensor.start();
    // ToDo: start embeded rotation sensor
}

bool NoGravityAccelerometerFilter::filter(QAccelerometerReading *reading)
{
    QRotationReading *rotationReading = this->_rotationSensor.reading();
    if (rotationReading) {
        qreal xRadian = rotationReading->x() * M_PI / 180;
        qreal yRadian = rotationReading->y() * M_PI / 180;
        reading->setX(reading->x() + GRAVITY * qCos(xRadian) * qSin(yRadian));
        reading->setY(reading->y() - GRAVITY * qSin(xRadian));
        reading->setZ(reading->z() - GRAVITY * qCos(xRadian) * qCos(yRadian));
        return true;
        // ToDo: implement reading filtering

    } else {
        return false;
    }
    return true;
}
