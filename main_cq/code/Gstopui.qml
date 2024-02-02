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
            x:770 * bI
            y:17 * bI
            color:"white"
            font.pixelSize: 13 /960 * parent.width
            font.family: gs_nls_ttf.name
        }
        Text {
            id: timeseconds
            x:863 * bI
            y:17 * bI
            color:"white"
            font.pixelSize: 13 /960 * parent.width
            font.family: gs_nls_ttf.name
        }
        Text {
            id: timemonth
            x:55 * bI
            y:478 * bI
            color:"white"
            font.pixelSize: 13 /960 * parent.width
            font.family: gs_nls_ttf.name
        }
        Text {
            id: timeday
            x:108 * bI
            y:478 * bI
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
        Item{//exitButton
            id:exitButton
            width: parent.width
            height: parent.height
            Image {
                x: 907 * bI
                y: 9 * bI
                visible: true
                width: 30 * bI
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
                x: 130 * bI
                y: 501 * bI
                width: 86 * bI
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
                x: 34 * bI
                y: 501 * bI
                width: 86 * bI
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
                x: 758 * bI
                y: 484 * bI
                width: 172 * bI
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




    Component.onCompleted: {
        video.play();       ///video
        getTimeString()     ///time
    }

    //Aboutair{}
}
