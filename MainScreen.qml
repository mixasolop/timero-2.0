import QtQuick
import QtQuick.Controls 2.15

Page  {
    width: 360
    height: 640
    visible: true
    title: qsTr("Timer")
    Image{
        id: background
        anchors.fill: parent
        source: "file:///D:/code/qt/time/time/background-main.png"
        fillMode: Image.PreserveAspectCrop

        Rectangle {
            id: rectangle
            x: 0
            y: 579
            width: 360
            height: 61
            color: "#f0fcec"
        }

        Image {
            id: image
            x: 46
            y: 579
            width: 60
            height: 53
            source: "file:///D:/code/qt/time/time/main-logo.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image1
            x: 254
            y: 579
            width: 60
            height: 53
            source: "file:///D:/code/qt/time/time/stats-logo.png"
            fillMode: Image.PreserveAspectFit
        }
    }
}
