#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "myscreen.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    MyScreen myScreen;
    engine.rootContext()->setContextProperty("dp", myScreen.dp());

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
