#include"fileservice.h"
#include<QFileDialog>
#include<QProcess>
#include<QDebug>
#include<QDirIterator>
#include<QDir>
#include <QJsonObject>

FileService::FileService()
{
    curr_dir = QDir("/");
}

FileService::~FileService()
{

}

QString FileService::getCurrDir(  )
{
    QString ret = curr_dir.absolutePath();
    qDebug() << "Curr absolute path" << ret;
    return ret;
}

QJsonObject FileService::getDir( QString path )
{

    QJsonObject ret;
    curr_dir.cd( path );

        foreach(QFileInfo item, curr_dir.entryInfoList() )
        {
            if(item.isDir())
            {
                //qDebug() << "Dir: " << item.absoluteFilePath();
                ret.insert( item.fileName(), "Dir");
            }

            else if(item.isFile())
            {
                //qDebug() << "File: " << item.absoluteFilePath();
                QString title = item.fileName();
                QString ending = "";

                for( int i = title.length() -1; i >= 0 ; i--)
                {
                    if( title[i] != '.' )
                        ending.prepend( title[i] );

                    else
                        break;
                }

                //qDebug() << ending << "ENGING";

                if( ending.compare("png") == 0
                        || ending.compare("jpg") == 0
                        || ending.compare("jpeg") == 0
                        || ending.compare("tif") == 0
                  )
                    ret.insert( title,  "Img");
            }

        }

    return ret;
}


