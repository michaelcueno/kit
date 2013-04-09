#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QQmlContext>
#include "backend.h"
#include "calendar.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    BackEnd backend;
    HomeAutomation homeAuto;
    Calendar calendar;

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/src/main.qml"));

    // Make the c++ classes avaliable to the QML via be
    viewer.rootContext()->setContextProperty("backEnd", &backend);
    viewer.rootContext()->setContextProperty("homeAuto", &homeAuto);
    viewer.rootContext()->setContextProperty("calendar", &calendar);

    viewer.showFullScreen();

    return app.exec();
}
