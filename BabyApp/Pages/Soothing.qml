import QtQuick 2.0
import Ubuntu.Components 1.3

import "../Components"

Page {
        id:_soothingPage
    //================= Header ====================

    header : PageHeader {
        id:eventsPageHeader
        title:i18n.tr("Soothing");

        leadingActionBar {
            actions: [
                Action {
                  id:backFromFeedingPage
                  iconName: "back"
                  onTriggered: {
                      console.log("Go back from Soothing page");
                      rootPage.removePages(_soothingPage)
                  }
                }
            ]
        }
    }


    PageBackground {
        image.source: "../Graphics/soothing.png"
    }
}
