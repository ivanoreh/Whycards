#include"conf.h"
#include<QFileDialog>

Config::Config()
{
    data["card_width_percentage"] = 0.32;
    data["language"] = "en";
}

Config::~Config()
{
    if( !data.empty() )
        delete &data;
}

void Config::set (QString &key, QString value)
{
    data[ key ] = value;
}

auto Config::get (QString &key)
{
    return data[ key ];
}

QString Config::getFileF()
{
    auto fileName = QFileDialog::getOpenFileName(
                nullptr,
                tr("Open Image"),
                "/",
                tr("Image Files (*.png *.jpg *.bmp)")
                );

    return fileName;
}
