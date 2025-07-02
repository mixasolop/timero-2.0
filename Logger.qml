import QtQuick
import QtQuick.Controls 2.15

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Hello World")

    Image {
        id: background
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        source: "file:///D:/code/qt/time/time/background.png"
        fillMode: Image.PreserveAspectCrop

        Rectangle {
            id: rectangle
            x: 12
            y: 212
            width: 337
            height: 271
            color: "#ffffff"
            radius: 40
            border.width: 0
            baselineOffset: 0

            Rectangle {
                id: rectangle1
                x: 38
                y: 83
                width: 261
                height: 2
                color: "#000000"
            }

            Text {
                id: text1
                x: 38
                y: 31
                width: 80
                height: 20
                text: qsTr("Username")
                font.pixelSize: 14
            }

            Rectangle {
                id: rectangle3
                x: 38
                y: 176
                width: 261
                height: 2
                color: "#000000"
            }

            Text {
                id: text2
                x: 38
                y: 126
                width: 80
                height: 20
                text: qsTr("Password")
                font.pixelSize: 14
            }
        }

        BorderImage {
            id: borderImage
            x: 130
            y: 39
            width: 100
            height: 100
            source: "file:///D:/code/qt/time/time/logo.png"
        }

        Text {
            id: text3
            x: -45
            y: 132
            width: 450
            height: 100
            color: "#ffffff"
            text: qsTr("Log In To Timer")
            font.pixelSize: 42
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
        }
    }

    Rectangle {
        x: 50
        y: 262
        width: 261
        height: 32
        color: "#e1ffe1"
    }
    TextInput {
        id: texts
        x: 50
        y: 262
        width: 261
        height: 32
        text: qsTr("")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        transformOrigin: Item.Right
    }

    Button {
        id: button
        x: 105
        y: 384
        width: 150
        height: 100
        background: transparent
        text: qsTr("Log In")
        font.underline: false
        font.bold: false
        font.pointSize: 22
        onClicked: {
            cppBackend.getuser(texts.text)
            cppBackend.getpass(texts1.text)
            cppBackend.adduser()
        }

    }

    Rectangle {
        x: 50
        y: 355
        width: 261
        height: 32
        color: "#e1ffe1"}
    TextInput {
        id: texts1
        x: 50
        y: 355
        width: 261
        height: 32
        text: qsTr("")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        echoMode: TextInput.Password
        transformOrigin: Item.Right
    }


    Text {
        id: warninguser
        x: 50
        y: 295
        width: 200
        height: 19
        visible: cppBackend.textVisible
        color: "#ff0010"
        text: qsTr("username already exist")
        font.pixelSize: 12
        font.italic: true
        font.bold: true
    }
}
