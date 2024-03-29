TEMPLATE = app

QT += qml quick widgets

SOURCES += src/main.cpp \
    src/conf.cpp \
    src/fileservice.cpp

RESOURCES += src/qml.qrc \
    src/assets.qrc

CONFIG += c++14

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    src/conf.h \
    src/fileservice.h

