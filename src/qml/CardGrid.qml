import QtQuick 2.0
import "../js/PopulateCardGrid.js" as Populate

Rectangle
{
    width: cards_area.width
    height: cards_area.height
    id: cardGridareea

    function addCard( url, txt)
    {
        cardModel.append(
                    {
                        source: url,
                        text: txt
                    }
                    );
    }

    function goToEnd()
    {
        cardGrid.positionViewAtEnd();
    }

    ListModel
    {
        id: cardModel
    }

    Component
    {
        id: cardDelegate
        Card
        {
            id: insertItem
            src: source
            txt: text
        }
    }

    GridView
    {
        id : cardGrid
        anchors.fill: parent
        model: cardModel
        delegate: cardDelegate

        cellHeight: this.cellWidth * 1.25
        cellWidth: cards_area.width * 0.33

    }

    Component.onCompleted: Populate.populate( cardModel )
}

