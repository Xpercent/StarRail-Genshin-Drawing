import QtQuick 2.12
import QtQuick.Controls 2.15
Item {
    id:item1
    property string font1: "Microsoft YaHei"
    function exit(){
        aboutexit.start()
        aboutButton.enabled= true;
        setButton.enabled =  true;
        topButton.enabled =  true;
    }

    Rectangle {
        id: about
        width: 220 * bI
        height: width * 434/220
        color: "#262c36"
        anchors.left: parent.left
        anchors.leftMargin: -220 * bI
        MouseArea {
            visible: true
            width:wM
            height:hM
            //anchors.fill: parent
            onClicked: {
                exit()
            }
        }

        Rectangle {
            id:lRectangle
            width: 35 * bI
            height: parent.height
            color: "#1a1a1a" // 切割部分的颜色

            }
        Text {
            text: "抽签软件"
            font.pixelSize: 20 * bI
            color: "#ffffff"
            font.family: font1
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id:t2
            text:"基于QML和C++开发\n版本:2023/1/12\n\n"
            anchors.left: lRectangle.left
            anchors.top:lRectangle.top
            anchors.leftMargin: 40 * bI
            anchors.topMargin: 40 * bI
            font.pixelSize: 14 * bI
            color: "#ffffff"
            font.family: font1
        }

        Text {
            id:t3
            text:verMap.say1
            anchors.left: lRectangle.left
            anchors.bottom:t2.bottom
            anchors.leftMargin: 40 * bI
            anchors.bottomMargin: -20 * bI
            font.pixelSize: 14 * bI
            color: "#ffffff"
            font.family: font1
        }
        Text {
            text:"Xpercent工作室制作\n贡献名单: YX\n\n未经允许,禁止转载！\n\n\n\n\n\n\n联系YX ↓"
            anchors.left: lRectangle.left
            anchors.bottom:t3.bottom
            anchors.leftMargin: 40 * bI
            anchors.bottomMargin: -230 * bI
            font.pixelSize: 14 * bI
            color: "#ffffff"
            font.family: font1
        }
        Text {
            id:text
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: "访问网站"
            font.pixelSize: 18 * bI
            color: "#4a9ad8"
            font.family: font1
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.openUrlExternally(verMap.website)
                }
            }
        }
        // 添加动画效果
        PropertyAnimation on x {
            target: about
            property: "anchors.leftMargin"
            to: 0 // 目标位置在窗口内
            duration: 1400 // 动画持续时间为 1 秒
            easing.type: Easing.OutQuad
        }

        PropertyAnimation on x {
            target: about
            id:aboutexit
            running: false
            property: "anchors.leftMargin"
            to: -290 * bI
            duration: 650 // 动画持续时间为 1 秒
            easing.type: Easing.OutQuad
            onFinished: {
                text.destroy()
                about.destroy()

            }
        }

    }

}
