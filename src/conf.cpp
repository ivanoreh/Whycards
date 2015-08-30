#include"conf.h"

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
