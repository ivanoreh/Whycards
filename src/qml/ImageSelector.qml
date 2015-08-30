import QtQuick 2.4
import "../js/ImageSelectorBack.js" as Backend

Rectangle {
    id: imageSelectorList
    width: cards_area.width * 0.9
    height: cards_area.height * 0.9
    anchors.centerIn: cards_area
    color: "transparent"

    z : 1000

    function show()
    {
        this.opacity  = 1;
    }

    function hide( url )
    {
        this.opacity = 0;
        selectedImg( url );
    }

    Behavior on opacity
    {
        NumberAnimation
        {
            duration: 500
        }
    }

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
                    topMargin : 5
                    bottom : parent.bottom
                    bottomMargin : 5
                    left : parent.left
                    leftMargin : 5
                }

                fillMode: Image.PreserveAspectFit
                asynchronous: true
                mipmap: true
                cache: true

                source: type == "Img" ?
                            "file://" + fileService.getCurrDir() + "/" + url :
                            "";

                Rectangle
                {
                    anchors
                    {
                        top: parent.bottom
                        //left: imageSelectorList.left
                    }

                    color: imageSelectorListItemImg.progress < 1.0 ? "red" : "green";
                    width: imageSelectorList.width * imageSelectorListItemImg.progress;
                    height: 9

                    visible: parent.progress < 1? true: false;

                }

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
                        imageSelectorList.hide("file://" + fileService.getCurrDir() + "/" + url );
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

