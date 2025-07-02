import QtQuick
import QtQuick.Controls 2.15

ApplicationWindow  {
    width: 360
    height: 640
    visible: true
    title: qsTr("Timer")
    StackView{
        id: stack
        anchors.fill: parent
        Component.onCompleted: {
            if(!cppBackend.is_logged)
                stack.push("Logger.qml")
            else
                stack.push("MainScreen.qml")
        }
    }

    Connections{
        target: cppBackend;
        onLoginSuccess:{
            stack.push("MainScreen.qml")
        }
    }
}
