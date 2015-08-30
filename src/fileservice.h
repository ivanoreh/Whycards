#ifndef FILESERVICE_H
#define FILESERVICE_H

#include <QObject>

class FileService: public QObject
{
    Q_OBJECT

public:

    FileService();
    ~FileService();

    Q_INVOKABLE QString getDefault( QVector<QString> &prefixes );
    Q_INVOKABLE QString getImage();


private:

};
#endif // FILESERVICE_H

