import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property alias image: _image
    property alias rect: _rect
    id:backgroundImage

    anchors.fill: parent
    layer.effect:FastBlur {
        radius: units.gu(3)
    }

    layer.enabled: true
    Image {
        opacity: 0.5
        id:_image
        anchors {
            bottom :parent.bottom
            left:parent.left
            right:parent.right
            rightMargin:parent.width*0.75
        }

        fillMode: Image.PreserveAspectFit
    }


    Rectangle {
        id:_rect
        anchors.fill: parent
        color: Qt.rgba(128,128,128,0.2)
    }
}
