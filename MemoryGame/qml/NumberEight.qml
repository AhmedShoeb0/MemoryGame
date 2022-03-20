import QtQuick 2.0
import Felgo 3.0

Rectangle{

    id:numberEight
    height: 100
    width: 100
    color: "transparent";

    Timer{
        id:card_timer
        interval:500
        running:false
        repeat:false
        onTriggered: {
        eight_img.visible=false;
        back.visible = true;
        }
        }

    Timer{
        id:endGameTimer
        interval:4500
        running:false
        repeat:false
        onTriggered: {
        endgame.play()
        }
    }


    Image {
        id: back
        source: "../assets/img/cover.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: 144
        width: 100
        visible: true

        }

    Image {
        id: eight_img
        source: "../assets/img/eight.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: 144
        width: 100
        visible: false

        }


    SoundEffect {
      id: notEqual
      source: "../assets/sounds/wrong.wav"
    }


    SoundEffect {
      id: equal
      source: "../assets/sounds/eight.wav"
    }

    SoundEffect {
      id: endgame
      source: "../assets/sounds/wellDone.wav"
    }

    MouseArea {
            anchors.fill: parent
            onClicked: {
                if(!eight && !eight_img.visible){
                    eight_img.visible = true;

                    if(itemsList.length !== 0){
//Equal
                        if(itemsList[0] === 8){
                                equal.play()
                                eight = true
                                itemsList.pop()
                                itemsList.pop()
                                //numberEight.destroy()
                                //numberEight8.destroy()
                                endGame.push(eight)
                            if(endGame.length===10)
                            {
                            endGameTimer.start();
                            }
                        }
//Not Equal
                        else{
                            notEqual.play()
                            card_timer.start();
                            itemsList[1].visible = false;
                            itemsList.pop();
                            itemsList.pop();
                        }
                    }
//First Item
                    else{
                        itemsList.push(8)
                        itemsList.push(eight_img)
                        }
                    }

                }

            }
    }
