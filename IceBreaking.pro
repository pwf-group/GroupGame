TEMPLATE = app

QT += qml quick

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
    qml/game/*.qml

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
include(myscreen/myscreen.pri)