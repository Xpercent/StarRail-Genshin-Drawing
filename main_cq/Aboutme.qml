import QtQuick 2.12

Item {
    id:item1
    FontLoader {
        id: pf_ttf
        source: "file:///" + appPath + "/font/SDK_SC_Web.ttf"
    }
    function exit(){
        aboutexit.start()
        aboutButton.enabled= true;
        setButton.enabled =  true;
        topButton.enabled =  true;
    }
    Rectangle {
        id: about
        width: 220 /  960 * wM
        height: width * 434/220
        color: "#262c36"
        anchors.left: parent.left
        anchors.leftMargin: -220 / 960 * wM
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
                width: 35 / 960 * wM
                height: parent.height
                color: "#1a1a1a" // 切割部分的颜色

            }
        Text {
            text: "\t 抽签软件"
            font.pixelSize: 20 / 960 * wM
            color: "#ffffff"
            font.family: pf_ttf.name
        }

        Text {

            text:"\n        基于QML和C++开发
        版本:2023/1/12
        来源:新世纪2023届94班
        现:惠阳一中高一17班\n
        Xpercent工作室制作
        贡献名单: YX
            \n        未经允许,禁止转载！
            \n\n\n\n\n\n\n         联系YX ↓"
            font.pixelSize: 14 / 960 * wM
            color: "#ffffff"
            font.family: pf_ttf.name
        }

        Text {
            id:text
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: "访问网站"
            font.pixelSize: 18 / 960 * wM
            color: "#4a9ad8"
            font.family: pf_ttf.name
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.openUrlExternally("https://xpercent-yx.github.io/")
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
            to: -290 / 960 * wM
            duration: 650 // 动画持续时间为 1 秒
            easing.type: Easing.OutQuad
            onFinished: {
                text.destroy()
                about.destroy()

            }
        }

    }
}
