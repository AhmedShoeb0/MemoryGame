import QtQuick 2.0
import Felgo 3.0

Rectangle{

    id:numberSix
    height: 100
    width: 100
    color: "transparent";

    Timer{
        id:card_timer
        interval:500
        running:false
        repeat:false
        onTriggered: {
        six_img.visible=false;
        back.visible = true;
        }
        }

    Timer{
        id:endGameTimer
        interval:4000
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
        id: six_img
        source: "../assets/img/six.png"
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
      source: "../assets/sounds/six.wav"
    }

    SoundEffect {
      id: endgame
      source: "../assets/sounds/wellDone.wav"
    }

    MouseArea {
            anchors.fill: parent
            onClicked: {
                if(!six && !six_img.visible){
                    six_img.visible = true;

                    if(itemsList.length != 0){
//Equal
                        if(itemsList[0] === 6){
                                equal.play()
                                six = true
                                itemsList.pop()
                                itemsList.pop()
                                //numberSix.destroy()
                                //numberSix6.destroy()
                                endGame.push(six)
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
                        itemsList.push(6)
                        itemsList.push(six_img)
                        }
                    }

                }

            }
    }
