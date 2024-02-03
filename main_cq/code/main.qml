import QtQuick 2.12
import QtQuick.Window 2.12
import start 1.0
import verof 1.0
Window {
    id:mywindows
    width: wM
    height: hM
    visible: true
    color: "#ffffff"
    minimumWidth: width
    minimumHeight: height
    maximumWidth: width
    maximumHeight: height
    title: qsTr("抽签")
    property string soundver: ""

    property int wM : mainDpi
    property int hM : wM *0.5625
    property real bI: wM/960
    property var verMap
    Loader {
        id:openui
        source: "Openui.qml"
        z:99
    }


    Start{
        id:startv
    }


    Loader {
        id:ui
        source: mainUI + ".qml"
    }

    Loader {
        id:cverqml
    }

    Ver{
        id:veroff
        onMyver: {
            verMap = v;
            console.log(verMap.v)
            cverqml.source = "Verof.qml"
        }
    }



    Component.onCompleted: {
        startv.start()
        veroff.ver();
    }





}
