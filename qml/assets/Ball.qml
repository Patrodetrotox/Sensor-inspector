import QtQuick 2.0

Rectangle {
    property point center: Qt.point(0, 0)
    property vector2d velocity: Qt.vector2d(0, 0)
    property vector2d acceleration: Qt.vector2d(0, 0)
    property real updateFrequency: 1000

    x: center.x - radius
    y: center.y - radius
    width: 2* radius
    height: 2* radius


    function validateX( ) {
        if (x < 0) {
            center.x = width / 2;
        } else if(x > parent.width - width) {
            center.x = parent.width - width /2
        } else {
            return;
        }
        velocity.x = -velocity.x
    }

    function validateY( ) {
        if (y < 0) {
            center.y = height / 2;
        } else if(y > parent.height - height) {
            center.y = parent.height - height / 2
        } else {
            return;
        }
        velocity.y = -velocity.y
    }

    // ToDo: make the ball reflect from the parent bounds

    Timer {
        interval: 1000 / updateFrequency
        repeat: true
        running: true

        onTriggered: {
            center.x += velocity.x / updateFrequency;
            center.y += velocity.y / updateFrequency;
            velocity.x += acceleration.x / updateFrequency;
            velocity.y += acceleration.y / updateFrequency;

            validateX();
            validateY();
        }
    }
    MouseArea {
        property vector2d pressedMousePosition

        anchors.fill: parent

        onPressed: pressedMousePosition = Qt.vector2d(mouseX, mouseY)
        onReleased: {
            velocity.x += 10 * (mouseX - pressedMousePosition.x)
            velocity.y += 10 * (mouseY - pressedMousePosition.y)
        }
    }
}
