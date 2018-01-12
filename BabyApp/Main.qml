import QtQuick 2.4
import Ubuntu.Components 1.3
import U1db 1.0 as U1db
import "./"
import "./Pages"

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    id:_mainView
//    property alias feedingPage: feedingPage
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "babyapp.etherpulse"

    anchors.fill: parent

    // Database to store the user preferences locally
    U1db.Database {
        id: babyAppDB
        path: "babyapp-db"
    }

    AdaptivePageLayout {
        id:rootPage
        asynchronous: true
        anchors.fill:parent
        primaryPage: menuPage
        //Main menu Page
        Menu {
            id:menuPage
            onSelected: {
                var addedPage = Qt.createComponent(pageUrl);
                rootPage.addPageToNextColumn(menuPage, addedPage)
            }
        }
    }
}
