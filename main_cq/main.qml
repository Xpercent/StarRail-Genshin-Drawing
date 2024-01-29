import QtQuick 2.12
import QtQuick.Window 2.12
import start 1.0
import verof 1.0
Window {
    id:mywindows
    width: wM
    height: hM
    visible: true
    color: "black"
    minimumWidth: width
    minimumHeight: height
    maximumWidth: width
    maximumHeight: height
    title: qsTr("抽签")
    property string soundver: ""

    property int wM : mainDpi
    property int hM : wM *0.5625
    property real bI: wM/960

    property var cver: ["0","基于QML和C++开发\n版本:2023/1/12\n\nXpercent工作室制作\n\n贡献名单: YX\n\n未经允许,禁止转载！\n\n\n\n\n\n\n联系YX ↓"]


    Loader {
        id:ui
        source: mainUI + ".qml"
    }

    Start{
        id:startv
    }

    Loader {
        id:cverqml

    }

    Ver{
        id:veroff
        onMyver: {
            cver = v;
            cverqml.source = "Verof.qml"
        }
    }
    Component.onCompleted: {
        startv.start()
        veroff.ver();
    }





}
