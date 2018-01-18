import QtQuick 2.0
import Ubuntu.Components 1.3

import "../Components"

Page {
        id:_statsPage
    //================= Header ====================

    header : PageHeader {
        id:eventsPageHeader
        title:i18n.tr("Statistics");

        leadingActionBar {
            actions: [
                Action {
                  id:backFromFeedingPage
                  iconName: "back"
                  onTriggered: {
                      console.log("Go back from stats page");
                      rootPage.removePages(_statsPage)
                  }
                }
            ]
        }
    }
    PageBackground {
        image.source: "../Graphics/statistics.png"
    }
}
