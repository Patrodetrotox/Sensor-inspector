 #include "NoGravityAccelerometer.h"

NoGravityAccelerometer::NoGravityAccelerometer(QObject *parent) : QAccelerometer(parent)
{
    this->addFilter(&this->_filter);

    // ToDo: apply filter
}
