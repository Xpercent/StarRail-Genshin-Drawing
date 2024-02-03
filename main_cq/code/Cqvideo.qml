import QtQuick 2.0
import QtMultimedia 5.0
import cqui 1.0
import QtQuick.Controls 2.0
import varof 1.0
Item{//Topvideo
    id:dovideo
    property var qstr_cqv: []
    property string font1: "Microsoft YaHei"
    width: wM
    height: hM

    Cqui{
        id:cquicpp

    }

    Rectangle {
        id: clickableRect
        width: parent.width
        height: parent.height
        color: "#000000"
        //z:-1
        opacity: 0
        enabled: false
       // visible: false  // 隐藏矩形
        MouseArea {
            anchors.fill: parent
            onClicked: {
                cq_video.source = ""
                click.enabled = true
            }
        }
    }

    Video {
        id: video
        width: parent.width
        height: parent.height
        autoPlay: true

    }
    Button {
        id:passB
        text: "跳过>"
        font.family: font1
        font.weight: Font.Bold
        font.pixelSize: 19 * bI
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 4 * bI
        anchors.topMargin: 4 * bI
        width: 68 * bI
        height: width * 33/68
        onClicked: {
            timer.interval = 200
            video.seek(video.duration - 300)
        }
    }
    Text {
        id: clickedText
        anchors.centerIn: parent
        visible : false
        font.family: font1
        font.weight: Font.Bold
        color: "#e2dfd5"
        font.pixelSize: 200 * bI
    }

    Text {
        id:text1
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 4 * bI
        anchors.topMargin: 4 * bI
        visible : false
        text: "点击任意处以关闭"
        font.family: font1
        font.weight: Font.Bold
        font.pixelSize: 18 * bI
        color: "#e2dfd5"
    }


    Timer {
            id: timer
            interval: video.duration - 200
            running: false
            repeat: true
            onTriggered: {
                clickableRect.opacity = 1
                clickableRect.enabled = true
                passB.visible = false
                video.volume = 0
                video.source = appPath + "/UI/" + mainUI + "/bgUI/" + qstr_cqv[0]
                timer2.start()
                clickableRect.visible = true

                clickedText.visible = true;
                text1.visible = true;
                timer.stop()
            }
    }
    Timer {
            id: timer2
            interval: video.duration - 200
            running: false
            onTriggered: {
                video.pause();
                timer2.stop()

            }
    }


    property string sound: ""
    Varo{
        id:varof
    }
    function videosound() {
        sound = varof.sound_var()
        if (sound == "on"){
        }
        else{
            video.volume = 0
        }
    }
    Component.onCompleted: {
        videosound()
        video.source= appPath + "/UI/" + mainUI + "/ck.mp4"
        timer.start()
        qstr_cqv = cquicpp.cqui(mainUI)
        clickedText.text = qstr_cqv[1]

    }
}

