import QtQuick 2.0
import Ubuntu.Components 1.3
import U1db 1.0 as U1db
import "../Components"

Page {
    id:_eventsPage
    //================= Data / Properties ====================


    // U1db Index to index all documents storing the world city details
    U1db.Index {
        id: feeding_by_datetime
        database: babyAppDB
        expression: [
            "feeding.datetime",
            "feeding.type",
        ]
    }

    // U1db Query to create a model of the world cities saved by the user
    U1db.Query {
        id: dbAllfeedingQuery
        index: feeding_by_datetime
        query: ["*"]
    }


    //================= Header ====================

    header : PageHeader {
        id:eventsPageHeader
        title:i18n.tr("Events");

        leadingActionBar {
            actions: [
                Action {
                  id:backFromFeedingPage
                  iconName: "back"
                  onTriggered: {
                      console.log("Go back from events page");
                      rootPage.removePages(_eventsPage)
                  }
                }
            ]
        }
    }


    //================= Content ====================

    UbuntuListView {
        id:eventsHistory
        anchors {
            left: parent.left
            right: parent.right
            top: eventsPageHeader.bottom
            bottom: parent.bottom
        }
        model:dbAllfeedingQuery

        delegate: ListItem {
                ListItemLayout  {
                    title.text:model.contents.type
                    subtitle.text: model.contents.datetime.toLocaleString()
                }
                leadingActions: ListItemActions {
                    actions: [
                        Action {
                          id:deleteFeedingEvent
                          iconName: "delete"
                          onTriggered: {
                              console.log("Delete feeding item at :"+index);
                              babyAppDB.deleteDoc(model.docId);
                          }
                        }
                    ]
                }
        }
    }

    //================= BottomEdge ====================

    BottomEdge {
        id:eventsBottomEdge
        height: Math.min(parent.height , units.gu(45))
        hint.text : i18n.tr("New Event");
        hint.status: BottomEdgeHint.Active
        contentComponent:  NewFeedingEvent {
            onSaveNewEvent: {
                 console.log(type);
                 console.log(datetime);
                 babyAppDB.putDoc({"feeding":{"type":type,"datetime":datetime}});

                 eventsBottomEdge.collapse();

            }

            onCancelNewEvent: {
                eventsBottomEdge.collapse();
            }
        }
        preloadContent: false

    }
}
