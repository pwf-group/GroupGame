#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQml>

#include "myscreen.h"
#include "ganalytics.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setOrganizationName("PW & Friends");
    app.setOrganizationDomain("waiwaibaka.com");
    app.setApplicationName("Group Game");
    app.setApplicationVersion("1.0.0");

    QQmlApplicationEngine engine;

    MyScreen myScreen;
    engine.rootContext()->setContextProperty("dp", myScreen.dp());
    qmlRegisterType<GAnalytics>("GoogleAnalytics", 0, 1, "GATracker");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
