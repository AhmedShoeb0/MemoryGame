import QtQuick 2.0
import Felgo 3.0

Rectangle{

    id:numberSeven
    height: 100
    width: 100
    color: "transparent";

    Timer{
        id:card_timer
        interval:500
        running:false
        repeat:false
        onTriggered: {
        seven_img.visible=false;
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
        id: seven_img
        source: "../assets/img/seven.png"
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
      source: "../assets/sounds/seven.wav"
    }

    SoundEffect {
      id: endgame
      source: "../assets/sounds/wellDone.wav"
    }

    MouseArea {
            anchors.fill: parent
            onClicked: {
                if(!seven && !seven_img.visible){
                    seven_img.visible = true;

                    if(itemsList.length !== 0){
//Equal
                        if(itemsList[0] === 7){
                                equal.play()
                                seven = true
                                itemsList.pop()
                                itemsList.pop()
                                //numberSeven.destroy()
                                //numberSeven7.destroy()
                                endGame.push(seven)
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
                        itemsList.push(7)
                        itemsList.push(seven_img)
                        }
                    }

                }

            }
    }
