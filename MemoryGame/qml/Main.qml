import Felgo 3.0
import QtQuick 2.0




GameWindow {
    property var itemsList: []
    property var endGame: []
    property var one: false
    property var two: false
    property var three: false
    property var four: false
    property var five: false
    property var six: false
    property var seven: false
    property var eight: false
    property var nine: false
    property var ten: false



    id: gameWindow

    activeScene: scene
    screenWidth: 1000
    screenHeight: 700





    Scene {
        id: scene
        anchors.fill: parent

        Image {
            id: background
            anchors.fill: parent
            source: "../assets/img/Back.jpg"
            visible: true
        }

            GameButton{
            id:quitButton
            width: 60
            height: 30
            x:dp(20)
            y:dp(10)
            text: "Quit"
            onClicked: Qt.quit()
            }




        Grid {
            columns: 5
            rows: 4
            spacing: 10

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            NumberOne {id: numberOne; color: "transparent"; width: 100; height: 144 }
            NumberTwo {id: numberTwo; color: "transparent"; width: 100; height: 144 }
            NumberFour {id: numberFour; color: "transparent"; width: 100; height: 144 }
            NumberSix {id: numberSix; color: "transparent"; width: 100; height: 144 }
            NumberTen {id: numberTen; color: "transparent"; width: 100; height: 144 }

            NumberFive {id:numberFive; color: "transparent"; width: 100; height: 144 }
            NumberEight {id:numberEight; color: "transparent"; width: 100; height: 144 }
            NumberThree {id:numberThree; color: "transparent"; width: 100; height: 144 }
            NumberOne {id:numberOne1; color: "transparent"; width: 100; height: 144 }
            NumberSeven {id:numberSeven; color: "transparent"; width: 100; height: 144 }

            NumberTen {id: numberTen10; color: "transparent"; width: 100; height: 144 }
            NumberSix {id: numberSix6; color: "transparent"; width: 100; height: 144 }
            NumberNine {id: numberNine; color: "transparent"; width: 100; height: 144 }
            NumberTwo {id: numberTwo2; color: "transparent"; width: 100; height: 144 }
            NumberFive {id:numberFive5; color: "transparent"; width: 100; height: 144 }

            NumberEight {id:numberEight8; color: "transparent"; width: 100; height: 144 }
            NumberThree {id:numberThree3; color: "transparent"; width: 100; height: 144 }
            NumberSeven {id:numberSeven7; color: "transparent"; width: 100; height: 144 }
            NumberFour {id: numberFour4; color: "transparent"; width: 100; height: 144 }
            NumberNine {id: numberNine9; color: "transparent"; width: 100; height: 144 }

          }

        }

    }



