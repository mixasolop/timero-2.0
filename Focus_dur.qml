import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import QtQuick.Layouts 1.15

Page  {
    width: 360
    height: 640
    property real totalRotation: 6
    property int totalMinutes: 1
    property real lastAngle: 0
    visible: true
    title: qsTr("Timer")
    Rectangle{
        id: background
        anchors.fill: parent
        color: "#181c2c"


        Item{
        id: clock
        x: 70
        y: 139
        width: 220
        height: 220

        Rectangle{
        anchors.fill: parent
        radius: width/2
        color: "#ffffff"
        }
        Rectangle{
        id: arrow
        x: 106
        y: 8
        width: 8
        height: 100
        antialiasing: true
        radius: 15
        color: "#181c2c"
        transform: Rotation{
            id: rod
            origin.x: arrow.width/2
            origin.y: arrow.height
            angle: totalRotation%360
            }
        }
        Rectangle{
            anchors.centerIn: parent
            width: 20
            height: 20
            color: "#181c2c"
            radius: width/2
        }
        Image {
            id: image3
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 4
            width: 240
            height: 240
            source: "file:///D:/code/qt/time/time/clock.png"
            fillMode: Image.PreserveAspectFit
        }

        MouseArea{
            anchors.fill: parent
            property real xcenter: clock.width/2
            property real ycenter: clock.height/2

            onPressed: {
                lastAngle = angleFromCenter(mouse.x, mouse.y)
            }

            onPositionChanged: {
                const CurrentAngle = angleFromCenter(mouse.x, mouse.y)
                var diff = CurrentAngle - lastAngle

                if(diff<-180) diff+=360;
                if(diff>180) diff-=360;

                if(totalRotation+diff<6){
                    return;
                }
                if(totalRotation+diff>8640) return;
                totalRotation+=diff
                lastAngle=CurrentAngle

                if(totalRotation < 9 || (Math.round(totalRotation / 6))%5 === 0){
                    totalMinutes=Math.max(1,Math.round(totalRotation/6))
                }
            }

            function angleFromCenter(x,y){
                const dx = x-xcenter
                const dy = y-ycenter
                const radians = Math.atan2(dy,dx)
                const angle = radians * 180/Math.PI
                return (angle+360)%360
            }
        }
    }

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

        Image {
            id: image2
            x: 150
            y: 579
            width: 60
            height: 53
            source: "file:///D:/code/qt/time/time/focus-logo.jpg"
            fillMode: Image.PreserveAspectFit

        }
        Text {
            id: _text
            x: 56
            y: 47
            color: "white"
            text: qsTr("Set Duration")
            font.pixelSize: 45
            font.bold: true
        }

        Text {
            id: _text4
            x: 52
            y: 407
            color: "#d8d8d8"
            font.pixelSize: 28
            text:{
                return "Actual time: " + (Math.floor(totalMinutes/60) < 10 ? "0" + Math.floor(totalMinutes/60) : Math.floor(totalMinutes/60)) + ":" + (totalMinutes%60 < 10 ? "0"+totalMinutes%60 : totalMinutes%60) + ":00"
            }
        }

        Button {
            id: button
            x: 186.5
            y: 460
            width: 112
            height: 68
            background: transparent
            Rectangle{
                id: cancel
                anchors.fill: parent
                anchors.centerIn: parent
                color: "#2b324d"
                radius: 20
            }
            Text{
                color: "#3cb85a"
                anchors.centerIn: cancel
                text: "Cancel"
                font.bold: true
                font.pixelSize: 27
            }
            onClicked: stack.pop()
        }
        Button {
            id: button1
            x: 61.5
            y: 460
            width: 112
            height: 68
            background: transparent
            Rectangle{
                id: select
                anchors.fill: parent
                anchors.centerIn: parent
                color: "#203c34"
                radius: 20
            }
            Text{
                color: "#3cb85a"
                anchors.centerIn: select
                text: "Select"
                font.bold: true
                font.pixelSize: 27
            }
            onClicked: {
                cppBackend.setTotalMinutes(totalMinutes)
                stack.replace("Countdown.qml")
            }
        }
    }
}
