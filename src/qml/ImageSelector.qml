import QtQuick 2.4
import "../js/ImageSelectorBack.js" as Backend

Rectangle {
    id: imageSelectorList
    width: cards_area.width * 0.9
    height: cards_area.height * 0.9
    anchors.centerIn: cards_area
    color: "white"

    z : 1000

    ListModel
    {
        id: dirModel
    }

    Component
    {
        id: dirDelegate
        Rectangle
        {
            width : imageSelectorList.width
            height : this.width * 0.2
            color: "white"

            radius: 5
            border
            {
                color : "blue"
                width : 3
            }

            Image
            {
                id : imageSelectorListItemImg
                anchors
                {
                    top : parent.top
                    topMargin : 3
                    bottom : parent.bottom
                    bottomMargin : 3
                    left : parent.left
                    leftMargin : 3
                }

                fillMode: Image.PreserveAspectFit
                asynchronous: true
                mipmap: true

                source: type == "Img" ?
                            "file://" + fileService.getCurrDir() + "/" + url :
                            "";
            }

            Text
            {
                anchors
                {
                    left: imageSelectorListItemImg.right
                    leftMargin : 3
                    top: parent.top
                    topMargin : 3
                    bottom: parent.bottom
                    bottomMargin : 3
                }

                font.pointSize: 14
                clip: true
                verticalAlignment: Text.AlignVCenter

                text: url
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    console.log("clicked", type, url)
                    if( type == "Dir")
                    {
                        Backend.getData( url , dirModel)

                    }

                    else
                    {
                        //some signal and collapse
                    }
                }
            }
        }
    }

    ListView
    {
        id : cardGrid
        anchors.fill: parent
        model: dirModel
        delegate: dirDelegate
        spacing: 3

        clip : true
    }

    Component.onCompleted:
    {
        Backend.getData("/", dirModel)
    }
}

