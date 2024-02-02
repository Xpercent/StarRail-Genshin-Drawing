import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.15
Item{
    Loader{
        id:ui
    }
    Loader {
        id: aboutairloade
    }
    Rectangle {
        id: about
        width: wM
        height: hM
        color: "#131313"
        opacity: 1 // 初始透明度为1
        z:99
        visible: false
        Image {
            id: open
            width: wM
            height: width * 1080 / 1920
            source: "file:///" + appPath+ "/UI/"+mainUI+"/open.png"
            opacity: 0
            SequentialAnimation on opacity{
                    NumberAnimation {
                        target: open
                        property: "opacity"
                        to: 1
                        duration: 400 // 持续时间，单位为毫秒
                    }
                    ScriptAction {
                        script: {
                            ui.source = mainUI + ".qml"
                            ui.enabled = false
                        }
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
                            about.destroy()
                            ui.enabled = true
                        }
                    }

                }

        }
    }
    Component.onCompleted: {
        if(mainUI === "Gstopui"){
            about.color = "#ffffff"
        }
        about.visible = true
    }

}
