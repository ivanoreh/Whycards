import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {

    id: actionBar
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight * 0.07

    anchors
    {
        bottom : parent.bottom
        left : parent.left
        right: parent.right
    }

    color: "grey"

    opacity : 1

    function buttonClicked( orderNum )
    {
        console.log("orderNum", orderNum)
        if ( orderNum == 0 )
        {
            imageSelector.hide();
        }

        if ( orderNum == 1 )
        {

        }

        if ( orderNum == 2 )
        {
            imageSelector.show();
        }

    }

    property int items: 3
    property var itemsTitle : ["back", "forward", "add"]
    property var itemsImg : ["/assets/ic_chevron_left_black_24dp.png", "/assets/ic_chevron_right_black_24dp.png", "/assets/ic_add_circle_outline_black_24dp.png"]

    Row
    {
        id : actionBarRow
        anchors.fill: parent

        spacing: 1

        Repeater
        {
            model : items

            Rectangle
            {
                color: "white"
                height: actionBar.height * 0.98
                width: actionBar.width * 0.333
                anchors.topMargin: 3
                anchors.top : actionBarRow.top

                Image
                {
                    id: optionsImage
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                    source: itemsImg[ index ]
                }

                MouseArea
                {
                    anchors.fill: parent;
                    onPressed:
                    {
                        parent.scale = 0.9
                    }

                    onReleased:
                    {
                        parent.scale = 1;
                    }

                    onClicked:
                    {
                        buttonClicked( index )
                    }
                }
            }
        }
    }
}

