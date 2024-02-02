import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Controls 2.15
Item {
    width: wM
    height: hM
    property string font1: "Microsoft YaHei"
    Item{
        width: parent.width
        height: parent.height
        opacity: 0
        id:mess
        Rectangle{
            width: parent.width
            height: parent.height
            color: "#ffffff"
            opacity: 0.3
        }
        Rectangle{
            width: 400 * bI
            height:width * 158/400
            color:"#2b2b2b"
            anchors.centerIn: parent
            radius: 5 // 设置圆角半径
            Text {
                text: "退出"
                font.family: font1
                font.weight: Font.Bold
                font.pixelSize: 33 * bI
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 10 * bI
                anchors.leftMargin: 20 * bI
                color: "#ffffff"
            }
            Text {
                text: "设置已做更改,是否重启程序?"
                font.family: font1
                font.pixelSize: 14 * bI
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 65 * bI
                anchors.leftMargin: 20 * bI
                color: "#ffffff"
            }
            Rectangle{
                width: parent.width
                height: 60 * bI
                color: "#202020"
                anchors.bottom: parent.bottom
                radius: 5 // 设置圆角半径
                Rectangle {
                    id:button1
                    width: 120 * bI
                    height: width* 28/120
                    anchors.left: parent.left
                    anchors.leftMargin: 25 * bI
                    anchors.verticalCenter: parent.verticalCenter
                    // property color normalColor: "#3e3e3e"
                    // property color hoverColor: "#444444"
                    color: "#3e3e3e"
                    radius: 5
                    Text {
                        text: "取消"
                        font.family: font1
                        font.pixelSize: 12 * bI
                        anchors.centerIn: parent
                        color: "#ffffff"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            animation3.start()
                        }
                    }
                }
                Rectangle {
                    id:button2
                    width: 120 * bI
                    height: width* 28/120
                    anchors.right: parent.right
                    anchors.rightMargin: 25 * bI
                    anchors.verticalCenter: parent.verticalCenter
                    // property color normalColor: "#4ca0e0"
                    // property color hoverColor: "#4591cc"
                    color:"#4ca0e0"
                    radius: 5
                    Text {
                        text: "退出"
                        font.family: font1
                        font.pixelSize: 12 * bI
                        anchors.centerIn: parent
                        color: "#000000"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            Qt.openUrlExternally(appPath + "/restart.vbs");
                        }
                    }
                }
            }

        }
    }
    PropertyAnimation{
        id : animation1
        target: mess
        property: "opacity"
        running: true
        to: 1
        duration: 200  // 动画时长，单位为毫秒
        easing.type: Easing.InOutQuad

    }
    PropertyAnimation{
        id : animation3
        target: mess
        running: false
        property: "opacity"
        to: 0
        duration: 200  // 动画时长，单位为毫秒
        easing.type: Easing.InOutQuad
        onStopped: {
            message.source = ""
        }
    }
}
