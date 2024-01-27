import QtQuick 2.0
import varof 1.0
import cqui 1.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.15
Item{
    width: wM
    height: hM
    FontLoader {
        id: icon_ttf
        source: "file:///" + appPath + "/font/Segoe_Fluent_Icons.ttf"
    }
    property string font1: "Microsoft YaHei"
    property string sound: ""
    property int m1: 0
    property string soundtext: ""

    function openmeun() {//安装目录
        Qt.openUrlExternally(appPath);
    }
    function howtouse() {//使用教程
        Qt.openUrlExternally(appPath + "/UI/How_to_Use.png");
    }
    function xupdate() {//更新修复
        Qt.openUrlExternally(appPath + "/Xupdate.exe");
        Qt.quit()
    }
    function myui() {
        if (trueUI === "Gstopui")
            uibox.currentIndex = 0
        else if (trueUI === "Srtopui")
            uibox.currentIndex = 1
        else
            uibox.currentIndex = 2
    }
    function changemyui(value) {
        varof.changeui(value)
        if (value === "or")
            trueUI = "or"
        else
            mainUI = value
            trueUI = value
        //console.log(value)
        //console.log(trueUI)
        message.source = "Message.qml"
    }
    function mydpi() {
        if (mainDpi === 1600)
            dpibox.currentIndex = 0
        else if (mainDpi === 1280)
            dpibox.currentIndex = 1
        else if (mainDpi === 960)
            dpibox.currentIndex = 2
    }
    function changemydpi(value) {
        if (value === "1600x900"){
            //mainDpi = 1600
            varof.changedpi(1600)
        }
        else if (value === "1280x720"){
            //mainDpi = 1280
            varof.changedpi(1280)}

        else if (value === "960x540"){
            //mainDpi = 960
            varof.changedpi(960)}
        message.source = "Message.qml"
    }
    function soundvar(){
        sound = varof.sound_var()
        if (sound === "on"){
            soundtext = "关闭声音"
        }
        else{
            soundtext = "开启声音"
        }
    }
    function soundof() {
        varof.changesound()
        soundvar()
    }
    function m1var(){
        m1 = varof.m1_var()
    }
    function changem1var(){
        varof.changem1_var(btn1_textinput.text)
        //varof.changem1_var(m1)

    }
    function reP() {// 重置概率
        cqui.ttoj()
    }

    Varo{
        id:varof
    }
    Cqui{
        id:cqui
    }


    Rectangle{
        id: setLabel
        width: 600 / 960 * wM
        height: width * 10/16
        color: "#1a1a1a"
        opacity: 0
        //source: "file:///" + appPath + "/UI/set_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        clip: true
        radius: 8

        Flickable {
            id:scrollView
            width: parent.width - leftitem.width  // Adjust width for the left button
            height: parent.height
            anchors.right: parent.right
            contentHeight: column.height
            ScrollBar.vertical: ScrollBar {policy: ScrollBar.AlwaysOn}
            Column {
                id:column
                spacing: 30 / 540 * hM
                Rectangle{
                    width: 1
                    height : 10 / 540 * hM
                    opacity: 0
                }
                Text{
                    id:text1
                    text:"基础设置"
                    color:"#ffffff"
                    font.family: font1
                    font.weight: Font.Bold
                    font.pixelSize: 18 / 540 * hM
                }

                Rectangle{
                    x:-10 / 960 * wM
                    y:120 / 540 * hM
                    width: setLabel.width - leftitem.width
                    height: 50 / 540 * hM
                    radius: 5
                    color:"#262c36"
                    Text {
                        id:uitext
                        text:"主界面UI"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 10 / 540 * hM
                        color:"#ffffff"
                        font.family: font1
                        font.pixelSize: 18 / 540 * hM
                    }
                    ComboBox {
                        id : uibox
                        width: height*4 / 960 * wM
                        height: 28 / 549 * hM
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 28 / 960 * wM
                        background: Rectangle {
                            color:"#3e3e3e"
                        }
                        editable: false
                        font.family: font1
                        font.pixelSize: 13 / 960 * wM
                        displayText: currentText
                        palette.buttonText: "#ffffff"
                        model: ["Gstopui", "Srtopui","or"]
                        onActivated: {
                                var selectedIndex = uibox.currentIndex;//var
                                var selectedText = uibox.currentText;
                                console.log("Selected Index:", selectedIndex);
                                console.log("Selected Text:", selectedText);
                                // 在这里调用你想要执行的函数
                                changemyui(selectedText);
                            }
                    }
                }
                Rectangle{
                    x:-10 / 540 * hM
                    y:120 / 540 * hM
                    width: setLabel.width - leftitem.width
                    height: 50 / 540 * hM
                    radius: 5
                    color:"#262c36"
                    Text {
                        id:dpitext
                        text:"分辨率"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 10 / 960 * wM
                        color:"#ffffff"
                        font.family: font1
                        font.pixelSize: 18 / 960 * wM
                    }
                    ComboBox {
                        id : dpibox
                        width: height*4 / 960 * wM
                        height: 28 / 549 * hM
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 28 / 960 * wM
                        background: Rectangle {
                            color:"#3e3e3e"
                        }
                        editable: false
                        font.family: font1
                        font.pixelSize: 13 / 960 * wM
                        displayText: currentText
                        palette.buttonText: "#ffffff"
                        model: ["1600x900", "1280x720","960x540"]


                        onActivated: {
                                var selectedIndex = dpibox.currentIndex;//var
                                var selectedText = dpibox.currentText;
                                //console.log("Selected Index:", selectedIndex);
                                //console.log("Selected Text:", selectedText);
                                // 在这里调用你想要执行的函数
                                changemydpi(selectedText)
                            }
                    }
                }
                Rectangle{
                        x:-10 / 540 * hM
                        width: setLabel.width - leftitem.width
                        height: 50 / 540 * hM
                        radius: 5
                        color:"#262c36"
                        Text {
                            id:btn5text
                            text:"声音"
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10 / 960 * wM
                            font.family: font1
                            color:"#ffffff"
                            font.pixelSize: 18 / 960 * wM
                        }
                        Rectangle {
                            id:btn5
                            width: height*4 / 960 * wM
                            height: 28 / 540 * hM
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 28 / 960 * wM
                            color: "#3e3e3e"
                            radius: 5 // 设置圆角半径
                            Text {
                                font.family: font1
                                font.pixelSize: 19 / 960 * wM
                                anchors.centerIn: parent
                                text: soundtext
                                color: "#ffffff"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    soundof()
                                    //text = soundtext
                                }
                            }
                        }

                    }
                Text{
                    id:text2
                    text:"概率设置"
                    color:"#ffffff"
                    font.family: font1
                    font.weight: Font.Bold
                    font.pixelSize: 18 / 540 * hM
                }
                Rectangle{
                    x:-10 /540 * hM
                    width: setLabel.width - leftitem.width
                    height: 50 / 540 * hM
                    radius: 5
                    color:"#262c36"
                    Text {
                        id:btn1text
                        text:"重置概率"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 10 / 960 * wM
                        font.family: font1
                        color:"#ffffff"
                        font.pixelSize: 18 / 540 * hM
                    }
                    Rectangle {
                        id:btn1
                        width: height*4 /540 * hM
                        height: 28 / 540 * hM
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 28 /540 * hM
                        color: "#3e3e3e"
                        radius: 5 // 设置圆角半径
                        Text {
                            font.family: font1
                            font.pixelSize: 19 /540 * hM
                            anchors.centerIn: parent
                            text: "重置概率"
                            color: "#ffffff"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                reP()
                            }
                        }
                    }
                } 
                Rectangle{
                    x:-10 /540 * hM
                    width: setLabel.width - leftitem.width
                    height: 100 /540 * hM
                    radius: 5
                    color:"#262c36"
                    Text {
                        id:btn1text_2
                        text:"留余人数"
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.topMargin: 16 /540 * hM
                        anchors.leftMargin: 10 /540 * hM
                        font.family: font1
                        color:"#ffffff"
                        font.pixelSize: 18 / 540 * hM
                    }
                    Rectangle {
                        id:btn1_2
                        width: height*4 / 540 * hM
                        height: 28 / 540 * hM
                        anchors.verticalCenter: btn1text_2.verticalCenter
                        anchors.rightMargin: 28 /540 * hM
                        anchors.right: parent.right
                        color: "#3e3e3e"
                        radius: 5 // 设置圆角半径
                        clip: true
                        TextInput {
                            id:btn1_textinput
                            width: parent.width- 5 / 540 * hM
                            height: parent.height
                            font.family: font1
                            font.pixelSize: 19 / 540 * hM
                            anchors.centerIn: parent
                            color: "#ffffff"
                            text : m1
                            autoScroll: true

                        }
                    }
                    Rectangle{
                        id:btn1_3
                        width: height*2 /540 * hM
                        height: 28 / 540 * hM
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 15 / 540 * hM
                        anchors.rightMargin: 28 / 540 * hM
                        anchors.right: parent.right
                        color: "#4ca0e0"
                        radius: 5 // 设置圆角半径
                        Text {
                            font.family: font1
                            font.pixelSize: 14 / 540 * hM
                            anchors.centerIn: parent
                            text: "Save"
                            color: "#000000"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                changem1var()
                            }
                        }
                    }

                }

                Text{
                    id:text3
                    text:"使用教程"
                    color:"#ffffff"
                    font.family: font1
                    font.weight: Font.Bold
                    font.pixelSize: 18 / 540 * hM
                }
                Rectangle{
                        x:-10 / 540 * hM
                        width: setLabel.width - leftitem.width
                        height: 50 / 540 * hM
                        radius: 5
                        color:"#262c36"
                        Text {
                            id:btn4text
                            text:"使用教程"
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10 / 540 * hM
                            font.family: font1
                            color:"#ffffff"
                            font.pixelSize: 18 / 540 * hM
                        }
                        Rectangle {
                            id:btn4
                            width: height*4 / 540 * hM
                            height: 28 / 540 * hM
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 28 / 540 * hM
                            color: "#3e3e3e"
                            radius: 5 // 设置圆角半径
                            Text {
                                font.family: font1
                                font.pixelSize: 19 / 540 * hM
                                anchors.centerIn: parent
                                text: "使用教程"
                                color: "#ffffff"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    howtouse()
                                }
                            }
                        }

                    }
                Text{
                    id:text4
                    text:"版本信息"
                    color:"#ffffff"
                    font.family: font1
                    font.weight: Font.Bold
                    font.pixelSize: 18 / 540 * hM
                }
                Rectangle{
                        x:-10 / 540 * hM
                        width: setLabel.width - leftitem.width
                        height: 50 / 540 * hM
                        radius: 5
                        color:"#262c36"
                        Text {
                            id:btn2text
                            text:"安装目录"
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10 / 540 * hM
                            font.family: font1
                            color:"#ffffff"
                            font.pixelSize: 18 / 540 * hM
                        }
                        Rectangle {
                            id:btn2
                            width: height*4 / 960 * wM
                            height: 28 / 540 * hM
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 28 / 540 * hM
                            color: "#3e3e3e"
                            radius: 5 // 设置圆角半径
                            Text {
                                font.family: font1
                                font.pixelSize: 19 / 960 * wM
                                anchors.centerIn: parent
                                text: "安装目录"
                                color: "#ffffff"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    openmeun()
                                }
                            }
                        }

                    }
                Rectangle{
                        x:-10 / 540 * hM
                        width: setLabel.width - leftitem.width
                        height: 50 / 540 * hM
                        radius: 5
                        color:"#262c36"
                        Text {
                            id:btn3text
                            text:"更新修复"
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10 / 540 * hM
                            font.family: font1
                            color:"#ffffff"
                            font.pixelSize: 18 / 540 * hM
                        }
                        Rectangle {
                            id:btn3
                            width: height*4 / 960 * wM
                            height: 28 / 540 * hM
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 28 / 540 * hM
                            color: "#3e3e3e"
                            radius: 5 // 设置圆角半径
                            Text {
                                font.family: font1
                                font.pixelSize: 19 / 540 * hM
                                anchors.centerIn: parent
                                text: "更新修复"
                                color: "#ffffff"
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    xupdate()
                                }
                            }
                        }

                    }


            }
        }

        Rectangle{
            id:leftitem
            width: 160 / 540 * hM
            height: setLabel.height
            color: "#00000000"
            Button {
                id:leftButton1
                anchors.top: parent.top
                anchors.topMargin: 20 / 540 * hM
                property color normalColor: "#00000000"
                property color hoverColor: "#3d3d3e"
                background: Rectangle {
                    color: leftButton1.hovered ? leftButton1.hoverColor : leftButton1.normalColor
                }
                text: "基础设置"
                font.family: font1
                font.weight: Font.Bold
                font.pixelSize: 18 / 540 * hM
                palette.buttonText: "#ffffff"
                onClicked: {
                    scrollView.contentY = (text1.y -20/ 540 * hM)
                }
            }
            Button {
                id:leftButton2
                anchors.top: leftButton1.top
                anchors.topMargin: 40 / 540 * hM
                property color normalColor: "#00000000"
                property color hoverColor: "#3d3d3e"
                background: Rectangle {
                    color: leftButton2.hovered ? leftButton2.hoverColor : leftButton2.normalColor
                }
                text: "概率设置"
                font.family: font1
                font.weight: Font.Bold
                font.pixelSize: 18 / 540 * hM
                palette.buttonText: "#ffffff"
                onClicked: {
                    scrollView.contentY = (text2.y -20/ 540 * hM)
                }
            }
            Button {
                id:leftButton3
                anchors.top: leftButton2.top
                anchors.topMargin: 40 / 540 * hM
                property color normalColor: "#00000000"
                property color hoverColor: "#3d3d3e"
                background: Rectangle {
                    color: leftButton3.hovered ? leftButton3.hoverColor : leftButton3.normalColor
                }
                text: "使用教程"
                font.family: font1
                font.weight: Font.Bold
                font.pixelSize: 18 / 540 * hM
                palette.buttonText: "#ffffff"
                onClicked: {
                    scrollView.contentY = (text3.y -20/ 540 * hM)
                }
            }
            Button {
                id:leftButton4
                anchors.top: leftButton3.top
                anchors.topMargin: 40 / 540 * hM
                property color normalColor: "#00000000"
                property color hoverColor: "#3d3d3e"
                background: Rectangle {
                    color: leftButton4.hovered ? leftButton4.hoverColor : leftButton4.normalColor
                }
                text: "版本信息"
                font.family: font1
                font.weight: Font.Bold
                font.pixelSize: 18 / 540 * hM
                palette.buttonText: "#ffffff"
                onClicked: {
                    scrollView.contentY = (text4.y -20/ 540 * hM)
                }
            }
            Text{
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 6 / 540 * hM
                anchors.left: parent.left
                anchors.leftMargin: 5 / 540 * hM
                text:"\uf3b1"
                font.family: icon_ttf.name
                color:"#ffffff"
                font.pixelSize: 40 / 540 * hM
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        setButton.enabled = true;
                        animation3.restart()
                        aboutButton.enabled = true;
                        topButton.enabled = true;
                    }
                }
            }
        }
   }
    Loader{
        id:message
    }



    PropertyAnimation{
        id : animation1
        target: setLabel
        property: "opacity"
        running: true
        to: 0.95
        duration: 300  // 动画时长，单位为毫秒
        easing.type: Easing.InOutQuad

    }
    PropertyAnimation{
        id : animation3
        target: setLabel
        running: false
        property: "opacity"
        to: 0
        duration: 300  // 动画时长，单位为毫秒
        easing.type: Easing.InOutQuad
        onStopped: {
            setlabe.source = ""
        }

    }
    Component.onCompleted: {
        soundvar()
        m1var()
        myui()
        mydpi()

    }

}
