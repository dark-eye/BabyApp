TEMPLATE = aux
TARGET = BabyApp

RESOURCES += BabyApp.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true) \
             Feeding.qml

CONF_FILES +=  BabyApp.apparmor \
               BabyApp.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)               

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
               BabyApp.desktop

#specify where the qml/js files are installed to
qml_files.path = /BabyApp
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /BabyApp
config_files.files += $${CONF_FILES}

#install the desktop file, a translated version is 
#automatically created in the build directory
desktop_file.path = /BabyApp
desktop_file.files = $$OUT_PWD/BabyApp.desktop
desktop_file.CONFIG += no_check_exist

INSTALLS+=config_files qml_files desktop_file

DISTFILES += \
    Feeding.qml \
    NewFeedingEvent.qml \
    Menu.qml \
    Soothing.qml \
    Faq.qml \
    Statistics.qml
