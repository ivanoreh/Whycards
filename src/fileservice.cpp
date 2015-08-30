#include"fileservice.h"
#include<QFileDialog>

FileService::FileService()
{

}

FileService::~FileService()
{

}

QString FileService::getDefault(QVector<QString> &prefixes)
{
    QString prefix = ")";

    for( int i = 0; i < prefixes.size(); i++)
        prefix += "*." +prefixes[i] + " ";

    prefix += ")";

    //TODO
    return "";
}

QString FileService::getImage()
{
    auto fileName = QFileDialog::getOpenFileName(
                nullptr,
                tr("Open Image"),
                "/",
                tr("Image Files (*.png *.jpg *.bmp)")
                );


    return fileName;
}
