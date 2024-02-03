import QtQuick 2.0
import verof 1.0
Item{
    width: wM
    height: hM
    id:myvero

    Rectangle {
        id: vvtitle
        width: 330 * bI
        height: width * 30/330
        color: "#323132"
        anchors.horizontalCenter: myvero.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: 20 * bI

        Text {
            id: name
            anchors.centerIn: parent
            font.pixelSize: 20 * bI
            color: "#e0e2df"
            font.family: "Microsoft YaHei"
        }
    }

    SequentialAnimation on opacity {
            id: animation2
            running: false
            loops: Animation.Infinite // 无限循环
            NumberAnimation {
                target: vvtitle
                property: "opacity"
                from: 1
                to: 0
                duration: 500 // 持续时间为1秒
            }
            NumberAnimation {
                target: vvtitle
                duration: 1000 // 持续时间为1秒
            }

            NumberAnimation {
                target: vvtitle
                property: "opacity"
                from: 0
                to: 1
                duration: 1000 // 持续时间为1秒
            }
        }

    Component.onCompleted: {
        if(verMap.v === "2024/02/02" || verMap.v === "0"){  //ver云版本 ！= 2024/01/12
            cverqml.source = ""
        }
        else{
            name.text = "发现新版本,请转到设置进行更新"
            animation2.start()
        }
    }

}
