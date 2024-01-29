import QtQuick 2.0
import verof 1.0
Item{
    width: wM
    height: hM
    id:myvero

    Timer {
        id: timer2
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            animation2.start()
        }
    }
    Rectangle {
        id: about
        width: 330 * bI
        height: width * 30/330
        color: "#323132"
        anchors.horizontalCenter: myvero.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: -200
        opacity: 1 // 初始透明度为1
        //x: -200 // 初始位置在窗口外

        Text {
            id: name
            anchors.centerIn: parent
            font.pixelSize: 20 * bI
            color: "#e0e2df"
            font.family: "汉仪文黑-85W"
        }
        PropertyAnimation on y {
            id:animation
            target: about
            running: false
            property: "anchors.topMargin"
            to: 20 * bI// 目标位置在窗口内
            duration: 1000 // 动画持续时间为 1 秒
            easing.type: Easing.OutQuad

        }
        SequentialAnimation on opacity {
                id: animation2
                running: false
                loops: Animation.Infinite // 无限循环
                NumberAnimation {
                    target: about
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 500 // 持续时间为1秒
                    easing.type: Easing.Linear
                }
                NumberAnimation {
                    target: about
                    duration: 1000 // 持续时间为1秒
                    easing.type: Easing.Linear
                }

                NumberAnimation {
                    target: about
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 1000 // 持续时间为1秒
                    easing.type: Easing.Linear
                }
            }
    }

    Component.onCompleted: {
        if(cver[0] === "2024/01/12" || cver[0] === "0"){  //ver云版本 ！= 2024/01/12
        }
        else{
            name.text = "发现新版本,请转到设置进行更新"
            animation.start()
            timer2.restart()
        }
    }

}
