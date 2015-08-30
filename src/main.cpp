#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "conf.h"
#include "fileservice.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Config config;
    FileService fs;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("config", &config);
    engine.rootContext()->setContextProperty("fileService", &fs);

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
