import QtQuick
import QtQuick.Controls 2.15

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Timer")
    StackView{
        id: stack
        anchors.fill: parent
        Component.onCompleted: {
            cppBackend.massege()
            if(!cppBackend.is_logged)
                stack.push("Logger.qml")
            else
                stack.push("MainScreen.qml")
        }

        Rectangle {
            id: rectangle
            x: 41
            y: 363
            width: 200
            height: 200
            color: "#000000"
        }

    }
}
