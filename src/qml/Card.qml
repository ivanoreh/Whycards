import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle
{
    id: marginArea
    color: "transparent"
    height: this.width * 1.25
    width: cards_area.width * 0.33

    property real margin: 10
    property string src: ""
    property string txt : "."

    Rectangle
    {
        id: card

        property bool selected: false
        height: marginArea.height - margin
        width: marginArea.width - margin

        color: "white"
        radius: 13
        border
        {
            width: 2
            color: "blue"
        }


        MouseArea
        {
            anchors.fill: parent
            onClicked: { parent.color = 'green' }
        }

        Image
        {
            id: cardImage
            width: parent.width - 2*margin
            anchors
            {
                top: parent.top
                topMargin: margin
                left: parent.left
                leftMargin : margin
                rightMargin : margin
            }

            fillMode: Image.PreserveAspectFit
            mipmap : true
            asynchronous: true
            cache: true

            source: src

        }

        Rectangle
        {
            id: cardTextArea
            width: cardImage.width
            color: "transparent"

            anchors
            {
                left: parent.left
                leftMargin: margin
                top: cardImage.bottom
                topMargin: margin*2
                bottom: parent.bottom
                bottomMargin: margin
            }

            Flickable
            {
                id: flickArea
                anchors.fill: parent
                contentWidth: cardText.width;
                contentHeight: cardText.height
                flickableDirection: Flickable.VerticalFlick
                clip: true

                Text
                {
                    id: cardText
                    //anchors.fill: cardTextArea
                    width: cardTextArea.width
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.horizontalAlignment
                    text: txt

                    font.pointSize: 12
                    clip: true
                }
            }
        }
    }
}
