import QtQuick 2.0
import Ubuntu.Components 1.3
import Ubuntu.Components.Pickers 1.3

Page {
    anchors.fill: parent

    signal saveNewEvent (string type , variant datetime );
    signal cancelNewEvent;

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
        id: column1
        width:parent.width
        anchors.top:newEventHeader.bottom
        Picker {
          id:newEventType

          width:parent.width
          height: units.gu(10)
          model:[i18n.tr("Feeding"),i18n.tr("Bottle"),i18n.tr("Poop"),i18n.tr("Peepee"),i18n.tr("PooPee")]
          delegate: PickerDelegate {
              Label {
                  anchors.margins: units.gu(2)
                  anchors.centerIn: parent
                  text: modelData
              }
          }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing:units.gu(1)

            DatePicker {
                id:newEventDate
                width: units.gu(23)
                mode:"Years|Months|Days"
            }
            DatePicker {
                id:newEventTime
                width:units.gu(12)
                mode:"Hours|Minutes"
            }
        }
    }
}
