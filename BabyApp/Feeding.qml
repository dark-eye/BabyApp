import QtQuick 2.0
import Ubuntu.Components 1.3

Page {
    header : PageHeader {
        id:feedingPageHeader
        title:i18n.tr("Feeding");

        leadingActionBar {
            actions: [
                Action {
                  id:backFromFeedingPage
                  iconName: "back"
                  onTriggered: {
                      console.log("Go back from feeding page");
                  }
                }
            ]
        }
    }

    ListModel {
        id:listModel
    }

    UbuntuListView {
        id:feedingHistory
        anchors {
            left: parent.left
            right: parent.right
            top: feedingPageHeader.bottom
            bottom: parent.bottom
        }
        model:listModel

        delegate: ListItem {
                ListItemLayout  {
                    title.text:model.type
                    subtitle.text:model.datetime
                }
                leadingActions: ListItemActions {
                    actions: [
                        Action {
                          id:deleteFeedingEvent
                          iconName: "delete"
                          onTriggered: {
                              console.log("Delete feeding item at :"+index);
                              listModel.remove(index);
                          }
                        }
                    ]
                }
        }
    }

    BottomEdge {
        id:feedingBottomEdge
        height:parent.height
        hint.text : i18n.tr("New Event");
        hint.status: BottomEdgeHint.Active
        contentComponent:  NewFeedingEvent {
            onSaveNewEvent: {
                 console.log(type);
                 console.log(datetime);
                 listModel.append({"type":type,"datetime":datetime});

                 feedingBottomEdge.collapse();

            }

            onCancelNewEvent: {
                feedingBottomEdge.collapse();
            }
        }
        preloadContent: true

    }
}
