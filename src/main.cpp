#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "conf.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Config config;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("config", &config);;

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
