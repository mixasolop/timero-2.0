import QtQuick
import QtQuick.Controls 2.5

Page{
    width: 360
    height: 640
    property int totalMinutes: cppBackend.getTotalMinutes()
    property int totalSeconds: totalMinutes*60
    property int totalRotation: totalSeconds/10
    property bool ishours: (totalMinutes>60 ? true : false)
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

    Image {
        id: image2
        x: 150
        y: 579
        width: 60
        height: 53
        source: "file:///D:/code/qt/time/time/focus-logo.jpg"
        fillMode: Image.PreserveAspectFit

    }
    Timer {
            id: countdownTimer
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                if (totalSeconds > 0) {
                    totalSeconds--
                    countdownCircle.requestPaint()
                } else {
                    countdownTimer.stop()
                    stack.replace("MainScreen.qml")
                }
            }
        }

    Item{
    id: clock
    x: 70
    y: 139
    width: 220
    height: 220
        Canvas{
            id: countdownCircle
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect(0, 0, width, height)
                var centerX = width/2
                var centerY = height/2
                var radius = width/2 - 20
                var StartEdge = -Math.PI/2
                var endAngle = StartEdge + ((totalSeconds/(totalMinutes*60))*2*Math.PI)


                ctx.beginPath()
                ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI)
                ctx.strokeStyle = "#111a1e"
                ctx.lineWidth = 12
                ctx.stroke()


                ctx.beginPath()
                ctx.arc(centerX, centerY, radius, StartEdge, endAngle, false)
                ctx.strokeStyle = "#3db08b"
                ctx.lineWidth = 12
                ctx.lineCap = "round"
                ctx.stroke()
            }
        }
        Text {
            id: _text
            anchors.centerIn: parent
            width: 152
            height: 60
            color: "#ffffff"
            text:{
                return (Math.floor(totalSeconds/3600) < 10 ? "0" + Math.floor(totalSeconds/3600) : Math.floor(totalSeconds/3600)) + ":" + (Math.floor(totalSeconds/60)%60 < 10 ? "0"+Math.floor(totalSeconds/60)%60 : Math.floor(totalSeconds/60)%60) + ":" + (totalSeconds%60<10 ? "0" + totalSeconds%60 : totalSeconds%60)
            }
            font.pixelSize: 36
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            }
    }
    }
}
