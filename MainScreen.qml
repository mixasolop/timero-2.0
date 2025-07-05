import QtQuick
import QtQuick.Controls 2.15

Page  {
    width: 360
    height: 640
    visible: true
    title: qsTr("Timer")
    Rectangle{
        id: background
        anchors.fill: parent
        color: "#181c2c"


        Image {
            id: image
            x: 24
            y: 579
            width: 60
            height: 53
            source: "file:///D:/code/qt/time/time/main-logo1.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image1
            x: 274
            y: 579
            width: 60
            height: 53
            source: "file:///D:/code/qt/time/time/stats-logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: _text
            x: 8
            y: 14
            color: "#d8d8d8"
            text: qsTr("FocusFlow")
            font.pixelSize: 27
            font.bold: false
        }

        Button{
            id: start_session
            x: 30
            y: 85
            width: 300
            height: 150
            background: transparent
            Rectangle{
                width: 300
                height: 150
                anchors.centerIn: parent
                color: "#134833"
                radius: 40
            }
            Text{
                anchors.centerIn: parent
                text: "Start Focus"
                color: "white"
                font.bold: true
                font.pixelSize: 45
                anchors.verticalCenterOffset: -6
                anchors.horizontalCenterOffset: 0
            }
            onClicked: stack.push("Focus_dur.qml")   
        }
    }

}
