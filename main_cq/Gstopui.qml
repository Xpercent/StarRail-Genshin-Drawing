import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtMultimedia 5.0
import varof 1.0
Item {
    width:wM
    height:hM
    FontLoader {
        id: gs_nls_ttf
        source: "file:///" + appPath + "/font/GS_NLS.ttf"
    }
    ///time------------------------
    function getTimeString() {
        var currentTime = new Date();
        var hours = currentTime.getHours();
        var minutes = currentTime.getMinutes();
        var seconds = currentTime.getSeconds();
        var month = currentTime.getMonth() + 1; // 月份从0开始，所以需要 + 1
        var day = currentTime.getDate();
        timehm.text = padZero(hours) +  padZero(minutes)
        timeseconds.text = padZero(seconds)
        timemonth.text = padZero(month)
        timeday.text = padZero(day)
    }
    function padZero(value) {
        return (value < 10 ? "0" : "") + value;
    }
    Varo{
        id:varof
    }

    ///time------------------------
    Item{//Topvideo
        width: parent.width
        height: parent.height
        Video {
            id: video
            width: parent.width
            height: parent.height
            source: appPath + "/UI/Gstopui/bg.mp4"
            autoPlay: false
            Timer {
                id: timer
                interval: 10
                running: true
                repeat: true
                onTriggered: {
                    if (video.position >= video.duration - 500) {
                        video.pause();
                        timer.restart();
                        video.seek(1);
                        video.play();
                    }
                }
            }
        }
    }
    Item{//Topphoto
        width: parent.width
        height: parent.height
        Image {
            id: photo
            width: parent.width
            height: width * 1080 / 1920
            opacity: 1
            visible : true
            source: "file:///" + appPath + "/UI/Gstopui/bg.png"
        }
    }
    Item{//datetime
        width: parent.width
        height: parent.height
        Text {
            id: timehm
            x:770 / 960 * parent.width
            y:17 / 540 * parent.height
            color:"white"
            font.pixelSize: 13 /960 * parent.width
            font.family: gs_nls_ttf.name
        }
        Text {
            id: timeseconds
            x:863 / 960 * parent.width
            y:17 / 540 * parent.height
            color:"white"
            font.pixelSize: 13 /960 * parent.width
            font.family: gs_nls_ttf.name
        }
        Text {
            id: timemonth
            x:55 / 960 * parent.width
            y:478 / 540 * parent.height
            color:"white"
            font.pixelSize: 13 /960 * parent.width
            font.family: gs_nls_ttf.name
        }
        Text {
            id: timeday
            x:108 / 960 * parent.width
            y:478 / 540 * parent.height
            color:"white"
            font.pixelSize: 13 /960 * parent.width
            font.family: gs_nls_ttf.name
        }
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: getTimeString()
        }
    }
    Item{
        id:click
        width: parent.width
        height: parent.height
        enabled: false
        Item{//exitButton
            id:exitButton
            width: parent.width
            height: parent.height
            Image {
                x: 907 / 960 * parent.width
                y: 9 / 540 * parent.height
                visible: true
                width: 30 / 960 * parent.width
                height: width * 50 / 50
                source: "file:///" + appPath + "/UI/Gstopui/exit.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Qt.quit()
                    }
                }
            }
        }
        Item{//aboutme
            id:aboutme
            width: parent.width
            height: parent.height
            Loader {
                id: aboutmyself
            }
            Image {
                id: aboutButton
                x: 130 / 960 * parent.width
                y: 501 / 540 * parent.height
                width: 86 / 960 * parent.width
                height: width * 32 / 130
                visible : true
                source: "file:///" + appPath + "/UI/Gstopui/aboutb.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        aboutButton.enabled= false;
                        setButton.enabled = false;
                        topButton.enabled = false;
                        aboutmyself.source = ""
                        aboutmyself.source = "Aboutme.qml"
                    }
                }
            }
        }
        Item{//set
            id:set
            width: parent.width
            height: parent.height
            Loader{
                id:setlabe
            }
            Image {
                id: setButton
                x: 34 / 960 * parent.width
                y: 501 / 540 * parent.height
                width: 86 / 960 * parent.width
                height: width * 32 / 130
                visible : true
                source: "file:///" + appPath + "/UI/Gstopui/setb.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        aboutButton.enabled= false;
                        setButton.enabled= false;
                        topButton.enabled = false;
                        setlabe.source = ""
                        setlabe.source = "Setlable.qml"
                        //setb.soundtxtchange()
                        //soundtext = setb.soundtext
                    }
                }
            }

        }


        Item{//ckbutton
            width: parent.width
            height: parent.height
            Image {
                id: topButton
                x: 758 / 960 * parent.width
                y: 484 / 540 * parent.height
                width: 172 / 960 * parent.width
                height: width * 66 / 289
                visible : true
                source: "file:///" + appPath + "/UI/Gstopui/ckbutton.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        click.enabled = false
                        //cq_video.source = ""
                        cq_video.source = "Cqvideo.qml"
                    }
                }
            }
        }
    }
    Loader {
        id: cq_video
    }

    Loader {
            id: aboutairloade
        }

    Item{
        width: parent.width
        height: parent.height
        Rectangle {
            id: about
            width: parent.width
            height: parent.height
            color: "#ffffff"
            //x: (960 - width) / 2
            //y:-200
            opacity: 1 // 初始透明度为1
            Image {
                id: open
                width: 960 / 540 * parent.height
                height: width * 1080 / 1920
                source: "file:///" + appPath+ "/UI/Gstopui/open.png"
                opacity: 0
                SequentialAnimation on opacity{
                        NumberAnimation {
                            target: open
                            property: "opacity"
                            to: 1
                            duration: 400 // 持续时间，单位为毫秒
                        }
                        PauseAnimation {
                            duration: 500 // 暂停时间
                        }

                        ParallelAnimation {
                            NumberAnimation {
                                target: about
                                property: "scale"
                                to: 2 // 放大倍数
                                duration: 470
                                easing.type: Easing.InOutQuart
                            }
                            NumberAnimation {
                                target: about
                                property: "opacity"
                                to: 0
                                duration: 470
                                easing.type: Easing.InOutQuart
                            }
                        }
                        ScriptAction {
                            script: {
                                // 在此处添加加载另一个QML的逻辑
                                aboutairloade.source = "Aboutair.qml"
                                click.enabled = true
                                about.destroy()
                            }
                        }

                    }

            }
        }
    }


    Component.onCompleted: {
        video.play();       ///video
        getTimeString()     ///time
    }

    //Aboutair{}
}
