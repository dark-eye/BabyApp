import QtQuick 2.0
import Ubuntu.Components 1.3

import "../Components"

Page {
        id:_faqPage
    //================= Header ====================

    header : PageHeader {
        id:eventsPageHeader
        title:i18n.tr("Faq");

        leadingActionBar {
            actions: [
                Action {
                  id:backFromFeedingPage
                  iconName: "back"
                  onTriggered: {
                      console.log("Go back from fuck page");
                      rootPage.removePages(_faqPage)
                  }
                }
            ]
        }
    }
    PageBackground {
        image.source: "../Graphics/question_mark.gif"
    }
}
