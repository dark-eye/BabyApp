import QtQuick 2.0
import Ubuntu.Components 1.3


Page {
    id:menuPage
    signal selected (string pageUrl)

    header : PageHeader {
        id:menuPageHeader
        title:i18n.tr("Baby App");
    }

    Image {
        anchors {
            bottom :parent.bottom
            left:parent.left
            right:parent.right
            rightMargin:units.gu(5)
        }

        fillMode: Image.PreserveAspectFit
        source:"Graphics/baby_1280.jpg"

    }

    ListView {
        id:menuList
        anchors {
            left: parent.left
            right: parent.right
            top: menuPageHeader.bottom
            bottom: parent.bottom
        }



        model: ListModel {
            ListElement {
                title:"Events"
                value: "Pages/Events.qml"
            }
            ListElement {
                title:"Soothing"
                value: "Pages/Soothing.qml"
            }
            ListElement {
                title:"Faq"
                value: "Pages/Faq.qml"
            }
            ListElement {
                title:"Statistics"
                value: "Pages/Statistics.qml"
            }

        }

        delegate: ListItem {
                ListItemLayout  {
                    title.text:model.title
                    Icon {
                        name:"go-next"
                        SlotsLayout.position: SlotsLayout.Trailing;
                        width:units.gu(2)
                    }

                }

                onClicked: {
                    menuPage.selected(model.value)
                }

        }
    }
}
