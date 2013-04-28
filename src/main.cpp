#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QQmlContext>
#include "backend.h"
#include "calendar.h"
#include "music.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    BackEnd backend;
    HomeAutomation homeAuto;
    Calendar calendar;
    Music music;

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/src/main.qml"));

    // Make the c++ classes avaliable to the QML via be
    viewer.rootContext()->setContextProperty("backEnd", &backend);
    viewer.rootContext()->setContextProperty("homeAuto", &homeAuto);
    viewer.rootContext()->setContextProperty("calendar", &calendar);
    viewer.rootContext()->setContextProperty("music", &music);

   // viewer.showFullScreen();
    viewer.showExpanded();

    return app.exec();
}
