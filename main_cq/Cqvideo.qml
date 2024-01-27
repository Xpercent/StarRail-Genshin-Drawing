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

    Video {
        id: video
        width: parent.width
        height: parent.height
        autoPlay: true

    }
    Video {
        id: video2
        width: parent.width
        height: parent.height
        autoPlay: false
        volume: 0
    }
    Button {
        id:passB
        text: "跳过>"
        font.family: font1
        font.weight: Font.Bold
        font.pixelSize: 19 / 960 * parent.width
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 4 / 960 * parent.width
        anchors.topMargin: 4 / 540 * parent.height
        // x:886 / 960 * parent.width
        // y:5 / 540 * parent.height

        width: 68 / 960 * parent.width
        height: width * 33/68
        //visible: false  // 隐藏
        onClicked: {
            video.seek(video.duration - 200)
        }
    }
    Text {
        id: clickedText
        anchors.centerIn: parent
        visible : false
        font.family: font1
        font.weight: Font.Bold
        color: "#e2dfd5"
        font.pixelSize: 200 / 960 * parent.width
    }

    Text {
        id:text1
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 4 / 960 * parent.width
        anchors.topMargin: 4 / 540 * parent.height
        visible : false
        text: "点击任意处以关闭"
        font.family: font1
        font.weight: Font.Bold
        font.pixelSize: 18 / 960 * parent.width
        color: "#e2dfd5"
    }
    Rectangle {
        id: clickableRect
        width: parent.width
        height: parent.height
        color: "white"
        opacity: 0
        visible: false  // 隐藏矩形
        MouseArea {
            anchors.fill: parent
            onClicked: {
                cq_video.source = ""

                click.enabled = true
            }
        }
    }
    Timer {
            id: timer
            interval: 100 // 调整定时器的间隔
            repeat: true
            running: false
            onTriggered: {
                if (video.position >= video.duration - 300) {
                    video.pause();
                    passB.visible = false
                    timer2.start()
                    video2.play();
                    clickableRect.visible = true

                    clickedText.visible = true;
                    text1.visible = true;
                    video.destroy()
                    timer.stop()
                }
            }
    }
    Timer {
            id: timer2
            interval: 100 // 调整定时器的间隔
            repeat: true
            running: false
            onTriggered: {
                if (video2.position >= (video2.duration - 300)) {
                    video2.pause();
                    timer2.stop()
                }
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
        video.play()
        timer.start();
        qstr_cqv = cquicpp.cqui(mainUI)
        video2.source= appPath + "/UI/" + mainUI + "/bgUI/" + qstr_cqv[0]
        clickedText.text = qstr_cqv[1]



    }
}

