QT += quick
CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += src/main.cpp \
    # ToDo: add NoGravityAccelerometer and NoGravityAccelerometerFilter cpp
    src/NoGravityAccelerometer.cpp \
    src/NoGravityAccelerometerFilter.cpp

HEADERS += \
    # ToDo: add NoGravityAccelerometer and NoGravityAccelerometerFilter headers
    src/NoGravityAccelerometer.h \
    src/NoGravityAccelerometerFilter.h

RESOURCES += \
    qml.qrc

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

# ToDo: add requires to use QtSensors in C++
QT += sensors

OTHER_FILES += \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
