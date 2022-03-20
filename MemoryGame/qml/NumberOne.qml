import QtQuick 2.0
import Felgo 3.0



Rectangle{

    id:numberOne
    height: 100
    width: 100
    color: "transparent";

    Timer{
        id:card_timer
        interval:500
        running:false
        repeat:false
        onTriggered: {
        one_img.visible=false;
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
        id: one_img
        source: "../assets/img/one.png"
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
      source: "../assets/sounds/one.wav"
    }

    SoundEffect {
      id: endgame
      source: "../assets/sounds/wellDone.wav"
    }


    MouseArea {
            anchors.fill: parent
            onClicked: {
                if(!one && !one_img.visible){
                    one_img.visible = true;

                    if(itemsList.length != 0){
//Equal
                        if(itemsList[0] === 1){
                                equal.play()
                                one = true
                                itemsList.pop()
                                itemsList.pop()
                                //numberOne.destroy()
                                //numberOne1.destroy()
                                endGame.push(one)
                            if(endGame.length===10)
                            {
                            endGameTimer.start();
                            }
                        }
//Not Equal
                        else{
                            notEqual.play();
                            card_timer.start();
                            itemsList[1].visible = false;
                            itemsList.pop();
                            itemsList.pop();

                        }
                    }
//First Item
                    else{
                        itemsList.push(1)
                        itemsList.push(one_img)
                        }
                    }

                }

            }
    }
