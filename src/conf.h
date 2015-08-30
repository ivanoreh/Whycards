#ifndef CONF_H
#define CONF_H

#include <QJsonObject>
#include <QHash>
#include <QVariant>
#include <QObject>

class Config : public QObject
{
    Q_OBJECT

public:

    Config();
    ~Config();

    Q_INVOKABLE QString getLanguage()
    {
        return language;
    };

    Q_INVOKABLE void set (QString &key, QString value);
    Q_INVOKABLE auto get (QString &key);

    Q_INVOKABLE QString getFileF();

private:

    QJsonObject data;
    QString language = "en";

    // screen percentage card' s width takes
    double card_width_percentage = 0.32;
};

#endif // CONFIG_H

