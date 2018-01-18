import QtQuick 2.0
import Ubuntu.Components 1.3

ListItem {
    property var iconMapping: {
        "Feeding" : "../Graphics/events/feeding.png",
        "Bottle" : "../Graphics/events/bottle.png",
        "Poop" : "../Graphics/events/poop.png",
        "Peepee" : "../Graphics/events/peepee.png"
    };

    ListItemLayout  {
        title.text:model.contents.type
        subtitle.text: model.contents.datetime.toLocaleString()

        Icon {
           SlotsLayout.position: SlotsLayout.Trailing;
           source: iconMapping[model.contents.type];
           width: units.gu(2);
           color: "#808080"
           keyColor: "#000000"
        }
    }
}
