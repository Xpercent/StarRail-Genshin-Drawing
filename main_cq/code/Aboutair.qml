import QtQuick 2.12

Rectangle {
    id: about
    width: 200 * bI
    height: width/ 2
    color: "#262c36"
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.leftMargin: -200 * bI
    //x: -200 // 初始位置在窗口外
    Rectangle {
            width: 40 * bI
            height: parent.height
            color: "#1a1a1a" // 切割部分的颜色
        }
    Text {
        text: "By YX!"
        anchors.top: parent.top
        anchors.topMargin: 4 * bI
        anchors.right: parent.right
        anchors.rightMargin: 40 * bI
        font.pixelSize: 24 * bI
        color: "#ffffff"
        font.family: "Microsoft YaHei"
    }
    Text {
        text: "了解更多请见详情" + "\n使用教程请见设置"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8 * bI
        anchors.right: parent.right
        anchors.rightMargin: 10 * bI

        font.pixelSize: 18 * bI
        color: "#ffffff"
        font.family: "Microsoft YaHei"
    }
    PropertyAnimation on x {
        target: about
        property: "anchors.leftMargin"
        to: 0 // 目标位置在窗口内
        duration: 1000 // 动画持续时间为 1 秒
        easing.type: Easing.OutQuad
        onFinished: {
            timer.start()
        }
    }
    Timer {
        id: timer
        interval: 3000 // 设置延迟时间为 2 秒
        onTriggered: {
            // 启动第二个动画
            animation2.start()
        }
    }
    PropertyAnimation {
        id: animation2
        target: about
        property: "anchors.topMargin"
        running: false
        to: -100 / 540 * wM // 第二个动画的目标高度
        duration: 200 // 第二个动画的持续时间为 1 秒
        easing.type: Easing.OutQuad
        onFinished: {
            aboutairloade.source = ""
            openui.source = ""
            //about.destroy()
        }
    }
}

