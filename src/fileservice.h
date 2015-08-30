#ifndef FILESERVICE_H
#define FILESERVICE_H

#include <QObject>
#include <QDir>
#include <QJsonObject>

class FileService: public QObject
{
    Q_OBJECT

public:

    FileService();
    ~FileService();

    Q_INVOKABLE QString getCurrDir(  );
    Q_INVOKABLE QJsonObject getDir( QString path);


private:
    QDir curr_dir;

};
#endif // FILESERVICE_H

