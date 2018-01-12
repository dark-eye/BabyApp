import QtQuick 2.0
import Ubuntu.Components 1.3
import Ubuntu.Components.Pickers 1.3

Page {
    id:_newFeedingEvent

    signal saveNewEvent (string type , variant datetime );
    signal cancelNewEvent;

    Rectangle {
        height:_newFeedingEvent.parent.parent.height
        width:parent.width
        color: theme.palette.normal.background
    }

    header: PageHeader{
        id:newEventHeader
        title: i18n.tr("New Event")
        leadingActionBar {
            actions: [
                Action {
                    id:neweventBack
                    iconName: "go-down"
                    onTriggered: {
                       console.log('Cancel new Event');
                       cancelNewEvent();
                    }
                }]
        }
        trailingActionBar {
            actions: [
                Action {
                    id:newEventSave
                    iconName: "ok"
                    onTriggered: {
                        console.log('Saving new Event');
                        var date = newEventDate.date
                        date.setHours(newEventTime.date.getHours());
                        date.setMinutes(newEventTime.date.getMinutes());
                        saveNewEvent(newEventType.model[newEventType.selectedIndex],date);
                    }
                }]
        }
    }

    Column {
        id: mainNewEventColumn
        width:parent.width
        anchors.top:newEventHeader.bottom
        spacing:units.gu(0.5)

        Row {
             id: basicInputsRow
            anchors.horizontalCenter: parent.horizontalCenter
            spacing:units.gu(0.25)

            Picker {
              id:newEventType
              width:units.gu(8)
              model:[i18n.tr("Feeding"),i18n.tr("Bottle"),i18n.tr("Poop"),i18n.tr("Peepee")]
              delegate: PickerDelegate {
                  Label {
                      anchors.margins: units.gu(1)
                      anchors.centerIn: parent
                      text: modelData
                  }
              }
            }

            DatePicker {
                id:newEventDate
                width: units.gu(22)
                mode:"Years|Months|Days"
            }
            DatePicker {
                id:newEventTime
                width:units.gu(9)
                mode:"Hours|Minutes"
                date:new Date()
            }
        }
        Row {
            id: poopInputs

            anchors.horizontalCenter: parent.horizontalCenter
            spacing:units.gu(0.25)
            visible: opacity != 0
            opacity: newEventType.selectedIndex == 2 || newEventType.selectedIndex == 4 ? 1 : 0
            Behavior on opacity {UbuntuNumberAnimation { duration: UbuntuAnimation.FastDuration}}

        }
        Row {
             id: feedInputs

            anchors.horizontalCenter: parent.horizontalCenter
            visible: opacity != 0;
            opacity: newEventType.selectedIndex == 0 || newEventType.selectedIndex == 1 ? 1 : 0
            spacing:units.gu(0.25)
            Behavior on opacity {UbuntuNumberAnimation { duration: UbuntuAnimation.FastDuration}}
            Label {
                anchors.verticalCenter: parent.verticalCenter
                text:i18n.tr("Feeding time") + ":"
            }

            DatePicker {
                id:feedingTime
                anchors.verticalCenter: parent.verticalCenter
                width:units.gu(15)
                height:units.gu(10)
                mode:"Hours|Minutes"
            }
        }
    }
}
