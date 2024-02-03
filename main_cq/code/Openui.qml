import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.15
Item{
    Loader {
        id: aboutairloade
    }
    Rectangle {
        id: openrect
        width: wM
        height: hM
        color: "#131313"
        opacity: 1 // 初始透明度为1
        //z:99
        Image {
            id: open
            width: wM
            height: width * 1080 / 1920
            source: "file:///" + appPath+ "/UI/"+mainUI+"/open.png"
            opacity: 0
        }
    }
    Timer{
        id:timer
        interval:900
        onTriggered: {
            pp.start()
            aboutairloade.source = "Aboutair.qml"
        }
    }
    PropertyAnimation{
        target: open
        running: true
        property: "opacity"
        to: 1 // 放大倍数
        duration: 400
    }
    ParallelAnimation{
        id:pp
        PropertyAnimation{
            target: openrect
            property: "scale"
            to: 2 // 放大倍数
            duration: 500
            easing.type: Easing.InOutQuart
        }
        PropertyAnimation{
            target: openrect
            property: "opacity"
            to: 0
            duration: 500
            easing.type: Easing.InOutQuart
        }

    }
    Component.onCompleted: {
        if(mainUI === "Gstopui"){
            openrect.color = "#ffffff"
        }
        timer.start()
    }

}
