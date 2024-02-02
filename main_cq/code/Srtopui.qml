import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtMultimedia 5.0
import QtGraphicalEffects 1.15
import varof 1.0

Item {

    FontLoader {
        id: sr_nls_ttf
        source: "file:///" + appPath + "/font/SR_NLS.ttf"
    }
    id:topui
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
    }
    function padZero(value) {
        return (value < 10 ? "0" : "") + value;
    }

    function changelight(){

        old_l = varof.re_sr_light(sr_Light,old_l)
        console.log(old_l)
        ///////////
        light.source = "file:///" + appPath + "/UI/Srtopui/L/"+ old_l[0]
        light_bg.x = Math.floor((Math.random() * (22 - 17 + 1)) + 17) * 10 * bI
        light_bg.y= Math.floor((Math.random() * (-5 - (-31) + 1)) + (-31)) * 10 * bI
        light_bg.source = "file:///" + appPath + "/UI/Srtopui/L/"+ old_l[0]
        light_bgbg.source = "file:///" + appPath + "/UI/Srtopui/L/" +old_l[0]
        ///////////
        light_another1.source = "file:///" + appPath + "/UI/Srtopui/L/" +old_l[1]
        light_another2.source = "file:///" + appPath + "/UI/Srtopui/L/" +old_l[2]
        light_another3.source = "file:///" + appPath + "/UI/Srtopui/L/" +old_l[3]
        ///////////
        light_timer.start()

    }
    function re_light_xy(){
        light_another1.opacity =1
        light_another1.x =247.5/960 * wM
        light_another1.y =283.5/540 * hM
        light_another1.width = 80.75/960 * wM
        light_another1_angle.angle = 13

        light_another2.x =187.5/960 * wM
        light_another2.y =341.75/540 * hM
        light_another2.width = 68/960 * wM
        light_another2_angle.angle = -12.4

        light_another3.x =311.5/960 * wM
        light_another3.y =333.5/540 * hM
        light_another3.width = 65.5/960 * wM
        light_another3_angle.angle = 24
    }

    property string light_img: ""
    property var old_l: []
    property int lightime: 30000
    Varo{
        id:varof
    }
    ///time------------------------
    Timer{
        id: light_timer
        interval: lightime
        repeat: true
        running: false
        onTriggered: {
            lanimation_s.start()
            //light_timer_then.start()
            light_timer_and.restart()
            light_timer.stop()

        }
    }
    Timer{
        id: light_timer_and
        interval: 800// 调整定时器的间隔
        repeat: true
        running: false
        onTriggered: {
            changelight()
            re_light_xy()
            light_another3.opacity=0
            light_another3_opacity.start()
            //lanimation_e.start()
            light_timer_and.stop()
        }
    }
    Timer{
        id: ringt
        interval: 50
        repeat: true
        running: true
        onTriggered: {
            top_ring.rotation = top_ring.rotation + 0.15
            ring2.rotation = top_ring.rotation
        }
    }



    Item{
        Image {
            //模糊
            id:light_bgbg
            x:0
            y :80 * bI
            width: 960 * bI
            height: width * 1390/1003
            //opacity: 0
            visible : true
            //sourceSize: Qt.size(960/4,width * 1.392/4)
            layer.enabled: true
            scale: 1.4
            layer.effect: GaussianBlur {
                radius: 14  // 调整模糊半径
                samples: 14  // 调整样本数量
            }
        }
    }
    //var randomNumber = Math.floor(Math.random() * (260 - 168 + 1)) + 168;
    Item {
        Rectangle {
                x : 171 * bI
                y : 78 * bI
                width: 704 * bI
                height: width * 437/704
                clip: true // This property ensures that content outside the rectangle is not visible
                Image {
                    id:light_bg
                    x: Math.floor((Math.random() * (22 - 17 + 1)) + 17) * 10 * bI
                    y: Math.floor((Math.random() * (-5 - (-31) + 1)) + (-31)) * 10 * bI
                    // x:225
                    // y:-50 * bI
                    width: 610 * bI
                    height: width * 1390/1003
                    //fillMode: Image.PreserveAspectFit
                    }
                }
    }
    Item {
        id: name
        Image {
                id: top_ring
                x: -284 * 0.375 * bI
                y: -284 * 0.544 * bI
                width: wM * 0.296
                height: width
                source: "file:///" + appPath+ "/UI/Srtopui/rings.png"
                rotation: 360
            }
    }
    Item{//Topphoto
        Image {
            id:bg
            //x:330
            //y : 80
            width: wM
            height: width * 1080 / 1920
            //opacity: 0
            visible : true
            source: "file:///" + appPath + "/UI/Srtopui/bg.png"
            smooth: true
        }
        Image {
                id: ring2
                x: 475 * bI
                y: 149 * bI
                width: 284 * bI
                height: width
                source: "file:///" + appPath+ "/UI/Srtopui/rings.png"
                rotation: 360
            }
    }
    Item {
        id: main_light
        Image {
            id: light
            x : 540/960 * wM
            y : 144/540 * hM
            width: 188.5/960*wM
            height: width * 1390/1003
            transform: Rotation {
                angle: 7
            }
        }

        Image {
            id: light_another1
            x : 247.5/960 * wM
            y : 283.5/540 * hM
            width: 80.75/960 * wM
            height: width * 1390/1003
            transform: Rotation {
                id:light_another1_angle
                angle: 13
            }
        }
        Image {
            id: light_another2
            x : 187.5/960 * wM
            y : 341.75/540 * hM
            width: 68/960 * wM
            height: width * 1390/1003
            transform: Rotation {
                id:light_another2_angle
                angle: -12.4
            }
        }
        Image {
            id: light_another3
            x : 311.5/960 * wM
            y : 333.5/540 * hM
            width: 65.5/960 * wM
            height: width * 1390/1003
            transform: Rotation {
                id:light_another3_angle
                angle: 24
            }
        }


    }
    property string ss: "OutQuart"
    ParallelAnimation{
        id:lanimation_s
        ////
        PropertyAnimation {
            target: light_another1
            property: "width"
            to: 65.5 * bI
            duration: 500  // 动画时长，单位为毫秒
            easing.type: ss
        }
        PropertyAnimation{
            target: light_another1
            property: "x"
            to: 311.5 * bI
            duration: 500  // 动画时长，单位为毫秒
            easing.type: ss
        }
        PropertyAnimation{
            target: light_another1
            property: "y"
            to: 333.5 / 540* hM
            duration: 500  // 动画时长，单位为毫秒
            easing.type: ss
        }
        PropertyAnimation {
            target: light_another1_angle
            duration: 500
            property: "angle"
            to: 24
            easing.type: ss
        }
        ////
        PropertyAnimation {
            target: light_another2
            property: "width"
            to: 80.75 * bI
            duration: 500  // 动画时长，单位为毫秒
            easing.type: ss
        }
        PropertyAnimation{
            target: light_another2
            property: "x"
            to: 247.5* bI
            duration: 500  // 动画时长，单位为毫秒
            easing.type: ss
        }
        PropertyAnimation{
            target: light_another2
            property: "y"
            to: 283.5 /540 * hM
            duration: 500  // 动画时长，单位为毫秒
            easing.type: ss
        }
        PropertyAnimation {
            target: light_another2_angle
            duration: 500
            property: "angle"
            to: 13
            easing.type: ss
        }
        ////
        PropertyAnimation {
            target: light_another3
            property: "width"
            to: 68* bI
            duration: 500  // 动画时长，单位为毫秒
            easing.type: ss
        }
        PropertyAnimation{
            target: light_another3
            property: "x"
            to: 187.5* bI
            duration: 500  // 动画时长，单位为毫秒
            easing.type: ss
        }
        PropertyAnimation{
            target: light_another3
            property: "y"
            to: 341.75 * bI
            duration: 500  // 动画时长，单位为毫秒
            easing.type: ss
        }
        PropertyAnimation {
            target: light_another3_angle
            duration: 500
            property: "angle"
            to: -12.4
            easing.type: ss
        }
        PropertyAnimation {
            target: light_another1
            duration: 500
            property: "opacity"
            to: 0
            easing.type: ss
        }
    }
    PropertyAnimation {
        id:light_another3_opacity
        target: light_another3
        duration: 200
        property: "opacity"
        to: 1
        easing.type: ss
    }




    Item{//datetime
        Text {
            id: timehm
            x:758 * bI
            y:26 /540 * hM
            color:"white"
            font.pixelSize: 13 * bI
            font.family: sr_nls_ttf.name
        }
        Text {
            id: timeseconds
            x:853 * bI
            y:26 /540 * hM
            color:"white"
            font.pixelSize: 13 * bI
            font.family: sr_nls_ttf.name
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
        Item{//exitButton
            id:exitButton
            Image {
                x: 922 * bI
                y: 23 /540 * hM
                visible: true
                width: 20 * bI
                height: width
                source: "file:///" + appPath + "/UI/Srtopui/exit.png"
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
            Loader {
                id: aboutmyself
            }
            Image {
                id: aboutButton
                x: 297 * bI
                y: 482 /540 * hM
                width: 112 * bI
                height: width * 53 / 225
                visible : true
                source: "file:///" + appPath + "/UI/" + mainUI +"/aboutbtn.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        aboutButton.enabled= false;
                        //setButton.enabled = false;
                        topButton.enabled = false;
                        aboutmyself.source = ""
                        aboutmyself.source = "Aboutme.qml"
                    }
                }
            }
        }


        Item{//set
            id:set
            Loader{
                id:setlabe
            }
            Image {
                id: setButton
                x: 167 * bI
                y: 482 /540 * hM
                width: 112 * bI
                height: width * 53 / 225
                visible : true
                source: "file:///" + appPath + "/UI/Srtopui/setbtn.png"
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
            Image {
                id: topButton
                x: 732 * bI
                y: 477 /540 * hM
                width: 168 * bI
                height: width * 60 / 308
                visible : true
                source: "file:///" + appPath + "/UI/" + mainUI +"/ckbtn.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        click.enabled = false
                        cq_video.source = ""
                        cq_video.source = "Cqvideo.qml"
                    }
                }
            }
        }
    }

    Loader {
        id: cq_video
        asynchronous: true
    }




    Component.onCompleted: {
        lightime = varof.lighttimer()
        //console.log(lightime)
        getTimeString()    ///time
        changelight()
    }
}
