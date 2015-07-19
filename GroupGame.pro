TEMPLATE = app

QT += qml quick multimedia

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources

ios {
    QMAKE_INFO_PLIST = ios-sources/Info.plist
    ios_icon.files = $$files($$PWD/ios-sources/AppIcon*.png)
    data.files = $$files($$PWD/qml/widget/*.wav)
    QMAKE_BUNDLE_DATA += ios_icon data
}

SOURCES += \
    src/main.cpp

RESOURCES += \
    qml/qml.qrc \
    qml/game/game.qrc \
    qml/widget/widget.qrc \
    qml/image/image.qrc \
    qml/fonts/fonts.qrc

OTHER_FILES += \
    qml/*.qml \
    qml/game/*.qml \
    qml/widget/*.qml \
    android-sources/AndroidManifest.xml \
    android-sources/src/org/pwf/groupgame/MyActivity.java

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
include(myscreen/myscreen.pri)
include(qt-google-analytics/qt-google-analytics.pri)
