import QtQuick 2.4
import Ubuntu.Components 1.3
import "./"
/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    id:_mainView
    property alias feedingPage: feedingPage
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "babyapp.etherpulse"

    anchors.fill: parent

    AdaptivePageLayout {
        id:rootPage
        asynchronous: true
        anchors.fill:parent
        primaryPage: feedingPage
        Feeding {            
            id: feedingPage
        }
    }
}
