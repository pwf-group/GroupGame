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
    app.setApplicationVersion("1.1.3");

    QQmlApplicationEngine engine;

    MyScreen myScreen;
    engine.rootContext()->setContextProperty("dp", myScreen.dp());

#if defined(Q_OS_ANDROID)
    engine.rootContext()->setContextProperty("platformOS", "android");
#elif defined(Q_OS_IOS)
    engine.rootContext()->setContextProperty("platformOS", "ios");
#else
    engine.rootContext()->setContextProperty("platformOS", "others");
#endif

    qmlRegisterType<GAnalytics>("GoogleAnalytics", 0, 1, "GATracker");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
