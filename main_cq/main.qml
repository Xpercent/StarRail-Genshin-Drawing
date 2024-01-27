import QtQuick 2.12
import QtQuick.Window 2.12

import start 1.0

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


    Loader {
        id:ui
        source: mainUI + ".qml"

    }

    Start{
        id:startv
    }
    Component.onCompleted: {
        startv.start()
    }


    Verof{}



}
