#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "NoGravityAccelerometer.h"

int main(int argc, char *argv[])
{
    // ToDo: register NoGravityAccelerometer class
    qmlRegisterType<NoGravityAccelerometer>("Sensor.Inspector", 1, 0, "NoGravityAccelerometer");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/sensor-inspector.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
