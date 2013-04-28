# Add more folders to ship with the application, here
folder_01.source = qml/src
folder_01.target = qml
folder_02.source = qml/src/main
folder_02.target = mainsrr
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    backend.cpp \
    homeautomation.cpp \
    clock.cpp \
    user.cpp \
    calendar.cpp \
    music.cpp

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    backend.h \
    homeautomation.h \
    globals.h \
    clock.h \
    user.h \
    calendar.h \
    music.h

RESOURCES += \
    resources.qrc

OTHER_FILES += \
    qml/src/clock/ClockApp.qml \
    qml/src/Commuting.qml \
    qml/src/UserScreen.qml \
    qml/src/ScreenSaver.qml \
    qml/src/Settings.qml
