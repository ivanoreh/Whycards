import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2

ApplicationWindow
{
    title: qsTr("Hello World")
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true

    signal selectedImg( string url )

    onSelectedImg:
    {
        cardGrid.addCard( url , "novo");
        cardGrid.goToEnd();
    }

    menuBar: MenuBar
    {
        Menu
        {
            title: qsTr("&File")
            MenuItem
            {
                text: qsTr("&Settings")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem
            {
                text: qsTr("&Backup")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem
            {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    MessageDialog
    {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption)
        {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }

    Rectangle
    {
        id: cards_area
        color: "red"
        height: parent.height * 0.95
        width:  parent.width * 0.98
        anchors.centerIn: parent

        radius: 10

        CardGrid
        {
            id: cardGrid
        }
    }

    ImageSelector
    {
        id: imageSelector
        opacity : 0;
        visible: false;
    }

    ActionBar
    {
        id: actionBar
    }

    Keys.onReleased: {
        if (event.key == Qt.Key_Back) {
            console.log("Back button captured - wunderbar !")
            event.accepted = true;
            imageSelector.hide();
        }
    }

    Component.onCompleted:
    {
        console.log("Screen: ", Screen.desktopAvailableHeight, Screen.desktopAvailableWidth )

    }
}
